# Offline Internationalization App Poc

The vast majority of internationalized apps are implemented by returning different languages through api requests. The so-called "content" does not refer to the UI interface of the APP, but the content information carried by the APP.

I have provided a different idea here. The core idea is to embed the part of the cloud API multilingual query that was originally in the cloud into the App by using Sqlite. There are three reasons:

- First, for specific content and data with information boundaries, embedding the data from the cloud to the local will get a faster response speed.

- Second, the users of the multilingual APP are people from various countries and regions. The network situation is complicated. The data can be embedded from the cloud to the local without being affected by the network and can be used offline.

- Third, I don’t have a cloud server 😂.
