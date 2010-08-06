## RefineryCMS-Translation ##

A simple approach to content translation for [RefineryCMS](http://refinerycms.org).

Features:

* Mark string or block as translatable in you view, key-value * locale.
* Let the end-user translate from Refinery backend
* On the first request that need translation, locale for every language is created
* You can define translated string to be edited with text_field or WYMeditor in the backend.
* Translation are cached
* When the content change, the translation is marked as out-dated to ease site maintenance.

### Install ###

Install the plugin

> script/plugin install git://github.com/unixcharles/refinerycms-translations.git

Copy the migration file

> rake refinerycms:translation:install

Run the migration

> rake db:migrate

Make sure you have correctly set the following setting in Refinery: 'i18n_frontend_translation_locales', 'i18n_translation_default_frontend_locale'

### Usage ###

Given the following code in you view:

> &lt;h1&gt;&lt;%= RefinerySetting.site_name %&gt;&lt;/h1&gt;

You can do:

> &lt;h1&gt;&lt;%= Translation.for_string('site name', RefinerySetting.site_name) %&gt;&lt;/h1&gt;

Or for more complex text:

> &lt;div id='footer'&gt;
> &lt;p&gt;Please give us a call! 1-877-555-1234&lt;/p&gt;
> &lt;p&gt;Copyright 2010 - Your Company Name&lt;/p&gt;
> &lt;/div&gt;

Using a block:

> &lt;div id='footer'&gt;
> &lt;% Translate.for_block('footer') do %&gt;
> &lt;p&gt;Please give us a call! 1-877-555-1234&lt;/p&gt;
> &lt;p&gt;Copyright 2010 - Your Company Name&lt;/p&gt;
> &lt;% end %&gt;
> &lt;/div&gt;

Note: for_string and for_block both take the option "wym" argument to edit the translation with the WYM editor. for_block default to true, for_string default to false.