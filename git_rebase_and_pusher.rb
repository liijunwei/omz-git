#!/usr/bin/env ruby

require 'optparse'
require 'open3'

class GitRebaseAndPusher
  attr_reader :options
  attr_reader :io
  attr_reader :original_branch

  def initialize(options, io = $stdout)
    @options = options
    @io = io
    @original_branch = `git rev-parse --abbrev-ref HEAD`
  end

  def run
    io.puts "skipped branches: #{branches - my_branches}"
    io.puts

    case options[:operation_type]
    when :rebase
      io.puts "rebase all my branches"

      my_branches.each do |branch|
        sh "git rebase --quiet #{default_branch} #{branch}"
      end
    when :reset
      io.puts "reset all my branches"

      my_branches.each do |branch|
        sh "git checkout --quiet #{branch}"
        sh "git reset    --quiet --hard HEAD@{u}"
      end
    when :force_push
      io.puts "force push all my branches"

      # https://git-scm.com/docs/git-push
      # refspec: <src>:<dst>
      my_branches.each do |branch|
        sh "git push origin --quiet --force-with-lease --force-if-includes #{branch}:#{branch}"
      end
    else
      raise "NOT SUPPORTTED"
    end

    io.puts
    sh "git checkout #{original_branch}"
  end

  private

  # Ensure I never touch other people's branch
  def my_branches
    @my_branches ||= begin
      branches.select do |branch|
        sh "git checkout --quiet #{branch}"

        merge_base_commitid = `git merge-base #{default_branch} HEAD`.chomp
        author_emails = `git log --format='%ae' #{merge_base_commitid}..HEAD`.split("\n")

        !author_emails.empty? && author_emails.all? {|email| email == my_email}
      end
    end
  end

  def default_branch
    @default_branch ||= `git rev-parse --abbrev-ref origin/HEAD`.chomp
  end

  def branches
    @branches ||= `git branch | grep "[^* ]+" -Eo`.split("\n")
  end

  def my_email
    @my_email ||= `git config --get user.email`.chomp
  end

  def sh(cmd)
    io.puts "running command: #{cmd}" if options[:verbose]

    out, err, status = Open3.capture3(*cmd)

    if status.success?
      out
    else
      $stderr.puts "output: #{out}"
      $stderr.puts "error: #{err}"
      $stderr.puts "status: #{status}"
      $stderr.puts "backtraces:"
      caller.each { |e| io.puts "\t#{e}" }

      raise "command failed"
    end
  end
end

options = {}

# https://docs.ruby-lang.org/en/2.1.0/OptionParser.html
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on("--ignore branch1,branch2", Array, "ignored branches") do |branches|
    options[:ignored_branches] = branches
  end

  opts.on("-t", "--type [TYPE]", [:rebase, :reset, :force_push], "Select operation type (rebase, reset, force_push)") do |t|
    options[:operation_type] = t
  end

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
end.parse!

GitRebaseAndPusher.new(options).run
