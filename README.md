# GoFetch

Prerequisites:
  * Install Node.js with:
    MacOS:
      - run `brew install node`
    Windows:
      - download at `https://nodejs.org/en/#home-downloadhead`

  * Install Erlang & Elixir with 
    MacOS:
      - Using Homebrew:
        - Update your homebrew to latest: brew update
        - Run: brew install elixir
      - Using Macports:
        -Run: sudo port install elixir
    Windows:
      - Download install from `https://github.com/elixir-lang/elixir-windows-setup/releases/download/v2.1/elixir-websetup.exe`
  * Get Github personal access token:
    - After logging into Github click on profile in top right and choose 'settings'
    - Select 'Develop Settings' from the side menu
    - The select 'Personal access tokens' from the side menu
    - Click 'Generate new token'
    - Give it a name and select all of 'repo' and the 'read:user' options
    - Click 'Generate token' and copy the resulting code
    - Paste code into the `token` variable in `/lib/go_fetch/git_caller.ex`

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.