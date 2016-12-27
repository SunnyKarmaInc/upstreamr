# Upstreamr

There should be brief project description. (2-3 sentences)
### Useful links
[Trello board]
BART API - ?

### Hackaton group:

* [Igor]
* [Dallas]
* [Dan]
* [Maria]

### Project Management Workflow
[Link to our Trello board]

Base columns and workflow:
**TODO** ---> **IN PROGRESS** ---> **DONE**

Typical extended workflow:
1. _Choose a card_ from **TODO** assigned to you or unnassained.
2. _Move card_ to **IN PROGRESS** (assign to yourself) and start working on it.
3. If there is a problem or question to discuss that stopped u _move card_ to **STOPPED** and write a comment inside the card. We will discuss it on next meeting or over slack. Start working on next card.
4. If everything ok and u done with card --->  _move card_ to **QA** (quality assurance / testing). Start working on next card.
5. _One of other team members_ do code review for task in **QA** and check if everything work in a proper way.
6. If there is a bug he moves card to **BUGS** with detailed comment.
7. If everything OK he moves card to **DONE**. And create pull request.

### Github Workflow

Commits messages should be descriptive. Start your message with verb: `Add` `Fix` `Change` `Refactor` `Remove` and follow with short but descriptive message what you have done.


###### General branches: ######
* **Master** for production ready code, that will be deployed to server (heroku prob)
* **Develop** for all our development code

All your work commits should be under **develop** branch. (exceptions for hot-fixes)

1. We should make **new feature-branch** for each **new general feature**.
2. On this **feature-branch** we will **create card-branches** for each trello card assosiated with this feature. ( It's optional. If card feature is small - no needed for separate sub-branch).
3. When **card is done** we merge _card-branch_ to _feature-branch_.
4. When **all cars/tasks for _feature-branch_ done** - we merge _feature-branch_ to _develop-branch_. And create pull request to **develop** branch.

[Link to our Trello board]: <https://trello.com/b/PIuC5QsF/upstreamr>
[Trello board]: <https://trello.com/b/PIuC5QsF/upstreamr>
[Igor]: <https://github.com/IgorDmitriev>
[Dallas]: <https://github.com/dallaswmorgan>
[Dan]: <https://github.com/dankim93>
[Maria]: <https://github.com/mbelgrader>
