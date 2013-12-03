Simple JIRA
-----------
[![Code Climate](https://codeclimate.com/repos/5261aa9256b10235ed104300/badges/fc3602c892b10c422d94/gpa.png)](https://codeclimate.com/repos/5261aa9256b10235ed104300/feed)[![Build Status](https://travis-ci.org/tomszymanski/simple_jira.png?branch=master)](https://travis-ci.org/tomszymanski/simple_jira)

This is a basic JIRA app that
  1. Connects to JIRA
  2. Does a Query
  3. Returns the Total Results of Said Query
    
Make sure to do this to prevent adding your personal credentials:
  ```
  git update-index --assume-unchanged config/config.yml
  ```
Next you'll need to update your config file with your credentials:
  ```
  vim config/config.yml 
  ```
  Then add your LDAP user/pass
Example for generating release notes for the MEME project:
  ```
  ruby app/simplejira.rb release_notes MEME
  ````
  This will grab all items in the accepted column

