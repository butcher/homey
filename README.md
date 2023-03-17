## Task

Use Ruby on Rails to build a project conversation history. A user should be able to:
 - leave a comment
 - change the status of the project

The project conversation history should list comments and changes in status.
Please don’t spend any more than 3 hours on this task.

## Preparations

In order to prefill db with some seeds please run `rake db:seed` before play with application.


## Q&A

 Q: We are going to write a history for the Project model. Can we assume that this records will be never removed from the original DB.
 A: Yes the business requirements that we store all (even removed) projects in the DB in order to have a clean history.

 Q: So we can link the history record to the specific object, but should we care about all the object information, maybe it make sence to store some copy of the object in order to use it later.
 A: No, it is not so valuable for now, we have to just store the history records.

 Q: What exactly we have to display currently in the history page?
 A: We should have a specific page for the project history, that should contain all the status changes and all the comments ordered by creation time.


So since the history subjects are non-removable we can safely link the history records to the subjects, but in order to store action details we have to display into UI let's use the simple text field with predefined structure. The most complex way is to store some payload in the JSON format to build any from it later, but for this test project we can go with the simplest way.
