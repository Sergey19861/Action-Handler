# Salesforce Technical  Design

## Functional Module: Action Handler

### Technical Design Specification

#### DOCUMENT INFORMATION AND APPROVALS

***

##### Version History

| Version # |    Date    |      Author       |     Reason for Change     |
|:---------:|:----------:|:-----------------:|:-------------------------:|
|    0.1    | 11.07.2022 | Sergey Krivorotov | Creation of functionality | 
|           |            |                   |                           |

***

### 1. Overview

This functionality is designed to repeatedly execute some logic in cases where an error occurs.
The logic will be executed a certain number of times (set in custom settings) until an error 
occurs or attempts are over. To use this functionality, extend the Action class then override 
the execute() method with your logic inside.

 - **Purpose and Audience**

This functionality is designed to simplify and generalize the execution of logic where errors
may occur beyond the control of the developer.

 - **Acronyms**

| Acronyms | Acronyms Description |
|:--------:|:--------------------:|
|          |                      |

 - **Supporting Project References**

[Git Hub](https://github.com/Sergey19861/Action-Handler)

***


### 2. Business UseCase
 - The project has a demo class that shows how to perform callouts to an external system (which may not work stably)

***

### 3. Design Overview

 - **Entity Relationship Diagram**
   ![Project Diagram](/images/diagram.jpg)

***

### 4. Objects Definition and Configuration

 - **Picklist Value Set**

No new global picklists were introduced to implement this feature.

 - **Standard Objects**

No changes have been delivered for this implementation

 - **Custom Objects**

No new Custom Objects were introduced to implement this feature.

***

### 5. Security Setup

 - **Profiles**

There are no new profiles introduced for this feature.

 - **Permission Sets** 

| Permission Set    | License Type |         Description (Access and assignment)          |
|:-----------------:|:------------:|:----------------------------------------------------:|
|  Action Handler   |     None     | Uses to give access to Action Handler functionality  |
|                   |              |                                                      |

 - **Sharing Settings**

 No changes in sharing setting related to any object as part of this feature.

***

### 6. User experience

Following will be user experience for various use stories being implemented as part of this feature.

***

### 7. Standard Setup Configurations

 - **List View Change**

|    #     | List View Name   | Assignment (RT/Profiles) |         Changes made                |           Comments                      |
|:--------:|:----------------:|:------------------------:|:-----------------------------------:|:---------------------------------------:|
|    1     |       All        |      For all users       | Added fields: Attempts and Interval | Added this list view for ActionSettings |
|          |                  |                          |                                     |                                         |

#1 ActionSettings All List View

![All List View](/images/actionSettingsAll.jpg)

***

### 8. Custom Setup Configurations


|      Name      |     API name      |      Type       |             Access             |
|:--------------:|:-----------------:|:---------------:|:------------------------------:|
| ActionSettings | ActionSettings__c | Custom Settings | Action Handler(permission set) | 
|                |                   |                 |                                |

ActionSettings

| Field label |  API name   |  Type  |                   Significance                   |             Access             |
|:-----------:|:-----------:|:------:|:------------------------------------------------:|:------------------------------:|
|  Attempts   | Attempts__c | Number | Define how many times the logic will be executed | Action Handler(permission set) | 
|  Interval   | Interval__c | Number |  Define how many minutes between next attempts   | Action Handler(permission set) |
|             |             |        |                                                  |                                |

***

### 9. Apex Business Logic

| Name               | Type            | Description                                                   |
|:-------------------|:----------------|:--------------------------------------------------------------|
| Action             | Apex Class      | Parent class for all Actions                                  | 
| ActionException    | Apex Class      | Created as Custom Exception for Action classes.               |
| ActionExecutor     | Apex Class      | Designed to execute logic form Action classes.                |
| ActionExecutorTest | Unit Test Class | Created to test Project classes functionality                 |
| ActionQueueable    | Apex Class      | Designed to execute Action logic in an async thread.          |
| ActionScheduler    | Apex Class      | Designed to schedule new Action job according Action settings |
| ActionUpdateRates  | Apex Class      | Demo class. Designed to demonstrate Action logic.             |
| MockFactory        | Apex Class      | Created to mock Http Callout Response in test methods.        |
|                    |                 |                                                               |

***

### 10. Lightning Components

No new Lightning Components were introduced to implement this feature.

***

### 11. Destructive Changes

List of classes, components, fields, objects, rule and other entities which were deleted during work on Epic/Feature.

| Element          | Type             | Reason (include Requirement Id if applicable)           |
|:-----------------|:-----------------|:--------------------------------------------------------|
|                  |                  |                                                         |

***

### 12. Review and Sign Off

 - **DOCUMENT REVIEWS**

| Version # | Reviewer | Review Date | Remarks |
|:----------|:---------|:------------|:--------|
|           |          |             |         | 


 - **DOCUMENT APPROVALS**

| Approver     | Project Role | Signature/Electronic Approval | Date |
|:-------------|:-------------|:------------------------------|:-----|
|              |              |                               |      | 
