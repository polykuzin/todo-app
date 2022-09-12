# CoreAnalytics

Gathering some form of analytics from your users is super important when continuously building, iterating on and improving a product. Learning how your users use your app in real life situations can sometimes be really surprising and take its development in new directions or act as inspiration for new features.
While there are definitely ways to take it too far and be very creepy with analytics, there are also many ways to implement systems that both inform you of how your product is actually used, while still respecting your users' privacy, data usage and overall experience.
However, implementing a solid analytics system that is also easy to use in code can be really difficult. This week, let's take a look at how such a system can be architected and implemented, based on one of my favorite Swift features - enums!

##The requirements

For our analytics system, we're going to have 4 goals:

- it needs to be easy to log events from any viewController (you only need one line of code to log something).
- The system schould support any underlying system for actually sending events to some form of backend.
- The system should be highly testable and easy to verify.
- It schould be asy to add, remove && modify events and get compile time errors whenever a call site needs to be updated.
