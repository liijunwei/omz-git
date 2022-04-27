**Migrate from [custom-omz-plugins](https://github.com/liijunwei/custom-omz-plugins)**

# Custom omz git plugins

**entry: omz-git.plugin.zsh**

### how to enable this plugin?

```zsh
vim $HOME/.zshrc

plugins=(
  # ...
  omz-git
)

source $HOME/.zshrc
```

+ TODO 整理出插件需要的环境变量, 统一管理, 降低重用的成本

# How to sync branches?

Use [git up](https://pypi.org/project/git-up/)

```bash
brew install pygitup
```

