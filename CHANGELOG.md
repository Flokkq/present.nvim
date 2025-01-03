# Changelog


## [0.2.0](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/compare/v0.1.0..v0.2.0) - 2024-12-26




### ✨ Features

- *(command)* Add help command and keybind - ([7a909ec](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/7a909ec11a6958144a65d134514e4333ce5b28f6))

### 🔧Chores

- *(cliff)* Update version references in README when bumping version - ([676124b](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/676124b163767f52c3393d4374c02c64b90968d0))

### 🚜 Refactoring

- *(ui)* Modularize ui creation - ([77895db](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/77895db7e0020800c8e568b36ddac1eb8b4a6188))


## [0.1.0] - 2024-12-26




### ✨ Features

- *(commads)* Add circular slide movement - ([f3e07a7](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/f3e07a795176f5ec4586b0744dc73083a36f839f))
- *(ui)* Set buf options for present mode - ([6532764](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/6532764070e33d2612a24eafff9188ea90c061cf))
- *(execute)* Execute code blocks in slides - ([554f69c](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/554f69c009d826a876a5bfb205e7fef7664166e3))
- *(plugin)* Expose command for starting a presentations - ([5597a4a](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/5597a4a21134cd89347e72cb79b9e2cbf4e650c5))
- *(ui)* Add footer with slide number and filename - ([e86290f](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/e86290fdefcfa8844078488c1fd763eaf7a87814))
- *(ui)* Handle buffer resize - ([d70ee99](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/d70ee99adf10112c06dffbd30a5eba502180c2bb))
- *(ui)* Render buffers as markdown - ([2de710f](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/2de710f4032194177e721ac35b8c43938c32a975))
- *(ui)* Split rendered slides into multiple buffers - ([ad0b365](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/ad0b3650c4ed277beb0efaef2ad08410fbcbfa0d))
- *(ui)* Hide cmdline in presentation mode - ([a22091a](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/a22091a5d972d93fc31cbc9f7a627b8ea1eb2951))
- *(keybinds)* Add navigation keybinds - ([ccca5e7](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/ccca5e7cbb13dfd8efab2df83608dcb9f7d5b17f))
- *(parser)* Parse and display buffer - ([78f6874](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/78f6874c5213e9564be552d3b4691cf6e9409d5b))

### 🎉 Initial Commit

- *(tests)* Add testing framework with plenary - ([bf31185](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/bf31185b9211664123751ec50dd783afefba7f80))
- *(lua)* Init with basic lua structure - ([c85dc6d](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/c85dc6dd11aecbb996d7dbee94332de14b2b44a8))

### 🔧Chores

- *(release)* Prepare for v0.1.0 - ([c539211](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/c53921128ad54ad9e49e70b8ced068591c710f20))
- *(repo)* Update README with install steps for packer and plug - ([25ddf52](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/25ddf522b9e63a92c88ab088548a72e3d3b070de))
- *(repo)* Add proper README - ([f0fd252](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/f0fd252e60b5c4c5861b9099bcec505d1bdca47c))
- *(ci)* Run unit_tests on push - ([84a1f0a](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/84a1f0a894a8f01b9ed5bcd97554fab215dcfeab))

### 🚜 Refactoring

- *(present)* Multiple files - ([e861b06](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/e861b06022e01252695931514210c4eafc1e81c8))
- *(present)* Move event listeners to own function - ([42735ad](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/42735ade5e64bf47d665ae32f0c8c6eab2a2749a))
- *(present)* Move nested function to outer scope - ([1179847](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/11798475cfb5ad90eb884e5f30ecda9a45c5478d))
- *(keybinds)* Extract keybinds into own function - ([344b2b5](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/344b2b5ae84850ba39cda943a0d4a15f2d07ed56))
- *(slides)* Refactor variables into globa `state` object - ([627a355](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/627a35550a9c718e04b93e7204debcb97c14bce7))
- *(slides)* Dry and better types - ([38752d7](https://github.com/Flokkq/https://github.com/orhun/git-cliff/blob/main/cliff.toml/commit/38752d75a547e1d7dfa9baa5b84e24bfd0d7b1db))
<!-- generated by git-cliff -->
