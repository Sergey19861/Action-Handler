# Salesforce Technical  Design

# Functional Module: Action Handler

### Technical Design Specification

#### DOCUMENT INFORMATION AND APPROVALS

***

##### Version History

| Version # |    Date    |      Author       |     Reason for Change     |
|:---------:|:----------:|:-----------------:|:-------------------------:|
|    0.1    | 11.07.2022 | Sergey Krivorotov | Creation of functionality | 
|           |            |                   |                           |
|           |            |                   |                           |
***

#### Table of Contents 
| Content                                     | page |
|:--------------------------------------------|-----:|
| 1. **Overview**                             |    4 |
| - Purpose and Audience                      |    4 |
| - Acronyms                                  |    4 |
| - Supporting Project References             |    4 |
| 2. **Assumptions**                          |    4 |
| - Assumptions                               |    5 |
| 3. **Business UseCase**                     |    5 | 
| - As-Is Capability                          |    5 | 
| 4. **Design Overview**                      |    5 |
| - High Level Design Approach                |    5 |       
| - Entity Relationship Diagram               |    5 |
| - Logical/Technical Flow Abstract           |    5 |
| 5. **Objects Definition and Configuration** |    5 |
| - Picklist Value Set                        |    5 |
| - Standard Objects                          |    6 |
| - Custom Objects                            |    6 |
| 6. **Security Setup**                       |    7 |
| - Profiles                                  |    7 |
| - Permission Sets                           |    7 |
| - Sharing Settings                          |    7 |
| 7. **User experience**                      |    7 | 
| 8. **Standard Setup Configurations**        |    7 |
| - Community configurations                  |    7 |
| - Layout Changes                            |    8 |
| 9. **Custom Setup Configurations**          |    8 |
| 10. **Apex Business Logic**                 |    8 |
| 11. **Lightning Components**                |    9 |
| 12. **Destructive Changes**                 |    9 |
| 13. **Review and Sign Off**                 |   10 | 

***

#### 1. Overview

This functionality is designed to repeatedly execute some logic in cases where an error occurs.

 - **Purpose and Audience**

The purpose of this document is to define design approach for development of capability to support developers

 - **Acronyms**

| Acronyms | Acronyms Description |
|:--------:|:--------------------:|
|          |                      |
|          |                      |
|          |                      |

 - **Supporting Project References**

Following are supporting references for the feature:

#### 2. Assumptions 
#### 3. Business UseCase
 - **As-Is Capability**
#### 4. Design Overview

 - **High Level Design Approach**
   ![Project Diagram](/images/diagram.jpg)

  
