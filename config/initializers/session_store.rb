# Be sure to restart your server when you modify this file.

Events::Application.config.session_store :cookie_store,
                                         key: '_eventit_session',
                                         expire_after: 1.year
