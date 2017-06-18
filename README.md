# Deviser

[![Code Climate](https://img.shields.io/codeclimate/github/hyperoslo/deviser.svg?style=flat)](https://codeclimate.com/github/hyperoslo/deviser)

There's [a](https://github.com/rcook/user_impersonate2) [small](https://github.com/astrails/rails_admin_impersonate) [variety](https://github.com/ankane/pretender) of projects related to impersonating users for support
purposes, but they all interfere with your project by requiring gems, routes and
views to be added.

Deviser allows impersonation straight from the command line for projects using
Devise.

**Supported Ruby versions: 1.9.3 or higher**

Licensed under the **MIT** license, see LICENSE for more information.

![Deviser](https://user-images.githubusercontent.com/378235/27263697-1ba9bd94-546f-11e7-87e3-30fc77731a19.png)

## Requirements

- Rails 3+ (this may need some testing)
- Devise
- Ruby [Readline](http://www.ruby-doc.org/stdlib-1.9.3/libdoc/readline/rdoc/Readline.html) support


## Usage

Since Deviser is shy and does not want to interfere with your project, it utilizes
[Homebrew's install technique](http://brew.sh/#install) to be portable and environment agnostic.

**Please note:** Verify the actual script before running this in production
environments, we are not responsible for any mutated cats.

Run the following in the root of your Rails project:

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/hyperoslo/deviser/master/deviser.rb)"

At the end of the wizard you'll be given a session key, which you can use in your
browser to immediately log in as the requested user.


### Heroku

Same procedure as above, but run the following instead:

    heroku run 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/hyperoslo/deviser/master/deviser.rb)"'


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create pull request


## Credits

Hyper made this. We're a digital communications agency with a passion for good
code, and if you're using this script we probably want to hire you.
