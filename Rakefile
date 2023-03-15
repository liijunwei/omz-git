# frozen_string_literal: true

desc 'rebase_branches'
task :rebase_branches do
  original_branch = `git rev-parse --abbrev-ref HEAD`
  default_branch = `git rev-parse --abbrev-ref origin/HEAD`.chomp
  branches = `git branch | grep "[^* ]+" -Eo`.split("\n")
  my_email = `git config --get user.email`.chomp

  case ENV['mode'].to_sym
  when :rebase
    puts "rebase all branches"

    branches.each do |branch|
      sh "git rebase --quiet #{default_branch} #{branch}"
    end
  when :reset
    puts "reset all branches"

    branches.each do |branch|
      sh "git checkout --quiet #{branch}"
      sh "git reset    --quiet --hard HEAD@{u}"
    end
  when :force_push
    puts "force push all branches"

    # ensure I never force push other people's branch
    my_branches = branches.select do |branch|
      sh "git checkout --quiet #{branch}", verbose: false

      mb_commitid = `git merge-base #{default_branch} HEAD`.chomp
      author_emails = `git log --format='%ae' #{mb_commitid}..HEAD`.split("\n")

      !author_emails.empty? && author_emails.all? {|email| email == my_email}
    end

    puts "skip force push for: #{branches - my_branches}"

    my_branches.each do |branch|
      sh "git checkout --quiet #{branch}"
      sh "git push     --quiet --force-with-lease --force-if-includes"
    end
  else
    raise "not supportted"
  end

  puts
  sh "git checkout #{original_branch}"
end
