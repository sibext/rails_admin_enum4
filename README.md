Rails Admin Enum 4
=====================

Rails Admin plugin for correct view Rails 4.1 Enum

<img style="position: relative; width: 768px; margin: 0;" src="http://www.sibext.com/products/rails-admin-enum4.png"/>

---

Installation
------------

    gem 'rails-admin-enum4'

    bundle install


Usage
-----

Generate new model by generator:

  rails g model Sibext service:integer

Execute migration:

  rake db:migrate

Add enum to your model:

    class Sibext < ActiveRecord::Base
      enum service: [:mobile_development, :web_development, :outsorsing]
    end

Execute rails with rails admin

Profit!

