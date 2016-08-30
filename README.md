# Cuke Displayer

Ideal for generating living documentation in 'business-friendly' (nb read 'people who can't use git and like pretty colours') format.

This is made up of two parts:

* *`translate.rb`* - a small ruby script that parses your `/features/` folder, and for each .feature file it finds generates a corresponding markdown (`.md`) file in `/_cukes/`
* *Jekyll project* - a standard implementation of the jekyll static-content generator (eg as used by the frameworkium documentation), which expects `.md` files in the `_cukes` folder.


# To Run

## Run the `translate.rb` script

```bash
# Install dependencies (there may be more - install using gem or bundler)
gem install gherkin
```

```bash
ruby translate.rb
```

## Run jekyll

```bash
# This will listen for changes to the project
bundle exec jekyll serve
```

## Browse to your new site!

This will be hosted at http://localhost:4000 by default

![Example Screenshot](/../master/assets/screenshot.png?raw=true "Example Screenshot")