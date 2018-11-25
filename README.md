# Envelope Budget - Rails App

This application allows the user to create and store a their daily expenses by category. Users can modify expenses, as well as add new expenses to their account. Users can login using a Facebook account if they wish.

## Installation

Clone down this repository. Then run "bundle" to install all the required gem files. Then you need to run "rake db migrate" and "rake db seed" to get the database set up. Once you have done that you can run "thin start --ssl" from your terminal to get the app running on your local host. 

If you wish to get the Facebook authentication part working you will need to create a key using [Facebook's Dev Site](https://developers.facebook.com/). On the Facebook Dev site, in the My Apps dropdown menu at the top-right of the page, select Add a New App, and a modal should appear. Fill out the requested information and click Create App ID. You should now be on the Product Setup page — if you are not, look in the sidebar for + Add Product under the Products heading. On the Product Setup page, click Get Started next to Facebook Login.  Choose the Web option, and enter https://localhost:3000/ when it prompts you for your Site URL. (NOTE: The key needs to be set up for the url for your localhost site and be be sure to use https://).  Click Save, and then click on Settings under the Facebook Login heading in the sidebar. In the Valid OAuth redirect URIs field, enter https://localhost:3000/auth/facebook/callback, which is the default callback endpoint for the omniauth-facebook strategy (again, use the url for your localhost site). Click Save Changes, and then click on Dashboard in the sidebar. In the BUdgeting app, create a .env file at the root directory level. Take the App ID and App Secret values from the Facebook app dashboard and paste them into the .env file as follows (be sure NOT to include any spaces or extra new lines):

FACEBOOK_KEY=xxxxx
FACEBOOK_SECRET=xxxx

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'BrownCow371'/envelope-budget-rails-app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the envelope-budget-rails-app project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'BrownCow371'/envelope-budget-rails-app/blob/master/CODE_OF_CONDUCT.md).
