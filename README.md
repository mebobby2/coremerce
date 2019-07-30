# Coremerce

## Prerequites
* .net core (https://dotnet.microsoft.com/download)

## DB Setup
1. Enter mysql console: ```mysql -u root -p```
2. Run command: ```source \path\to\project\db.sql;```

## Run
1. ```dotnet run```
2. Visit: https://localhost:5001/api/values

## Package Management
To add a package:
```
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
```

## Notes
### REST
Stands for representational state transfer. It is an architectural style that defines a set of guidelines for building web services. An architectural style is a concept with predefined principles.

However, the implementation of REST will definitely differ from developer to developer. There is no fixed implementation style. Don't get confused with **architectural patterns**, which are not concepts but the actual implementations. MVC is an architectural pattern as it has a fixed structure that defines how the components interact with each other where they can't be differently implemented.

#### REST Contraints
REST is defined by six constraints that enforce a design decision for the service that is to be followed. If it is not followed, the service can't be denoted as RESTful.

##### Client-server architecture
The client or the consumer of the service should not worry about how the server processes the data and stores it in the database. Similarly, the server does not need to depend on the client's implementation, especially the UI.

The service, when interacted with by the clients, provides enough information about its nature: how to consume it, and what operations you can carry out using it.

There is absolutely no relation between the client and the server, and they can be completely decoupled if they adhere to all these constraints perfectly.

##### Stateless
A request in a RESTful service does not depend on a past request. The service treats each request independently.

##### Caching
Is a technique used to store the data either on the client's or the server's side. This cached data may be used for further reference whenever it is required. There are different kinds of HTTP headers used for controlling caching.

##### Code on demand (optional)
As the phrase *code on demand* suggests, the service may try to execute code on the client to extend the functionality. However, this is optional , and not every service does this.

##### Uniform interface
When we encounter the word *interface*, the first thing that comes to our mind is decoupling. We create interfaces to have loosely coupled architecture, and the same type of architecture is seen in the case of RESTful.

However, to implement such a decoupling between the client and the service, standards are defined that every RESTful service supports.

REST is defined by four interface constraints:
1. Identification of resources: A URI is used to identify a resource. The resource is a web document.
2. Manipulation of resources through representations: When a client has a given resource - along with any metadata - they should have enough information to either modify or delete the resource. So, for example, GET means that you want to retrieve data about the URI-identified resource. You can describe an operation with an HTTP method and a URI.
3. Self-descriptive messages: The messages passed should contain enough information about the data to be understood and processed for further operations. MIME types are used for this purpose.
4. Hypermedia as the engine of the application state (HATEOAS): The representation returned from the service should contain all the future actions as links. It is the same as visiting a website in which you find different hyperlinks providing you with the different types of available operations.

Implementing these verbs in our services would mark them as standardized.
* GET - Read/retrieve a resource. (safe)
* PUT - Either insert a new resource or update the resource if it already exists. (Idempotent)
* POST - Insert a new resource. Can be used to update an existing resource as well. (Nonidempotent)
* DELETE - Delete a resource. (Idempotent)
* OPTIONS - Get a list of all the allowed operations for a resource. (safe)
* HEAD - Return only the response headers with no response body. (safe)

A safe operation when performed on the service does not have any effect on the original value of the resource. As the GET, OPTIONS, and HEAD verbs only retrieve or read the resource-related stuff and does not update that, they are safe.

An idempotent (can be repeated) operation when performed gives the same result no matter how many times we perform it. For example, when you make a DELETE or PUT operation, you are actually operating on a particular resource, and the operation can be repeated with no issues.

###### POST vs PUT
PUT is idempotent - it can be repeated, and yields the same result every time. If the resource does not exist, it will create it; otherwise, it will update it.
POST is nonidempotent - multiple resources will be created if it is called more than once.

The preceding contrast between these verbs is just a general difference. However, there is a very important and significant difference. When using PUT, specifying the complete URI of the resource is necessary. Otherwise, it won't work. For example, the following won't work as it does not specify the exact URI of the author, which can be done by specifying an ID:
```
PUT http://service.com/authours/
```
To fix this, you can send an ID with this URI using something like the following:
```
PUT http://service.com/authours/19
```

This means that the author with the ID 19 will be processed, but if that does not exist, it will be created first. Subsequent requests with this URI will be considered as requests to modify the author resource with an ID of 19.

On the other hand, if we do the same with a POST request like the following, it will create a new author resource with the posted data:
```
POST http://service.com/authours/
```
Interestingly, if you repeat this, you will be responsible for duplicate records with the same data. That is why it is *nonidempotent* in nature.

Note the following request with POST with an ID. Unlike PUT, POST won't consider this for a new resource, if that is does not exist. It will always be treated as an update request:
```
POST http://service.com/authours/19
```

The following are the main points to focus on:
* PUT creates or updates one resource, as long as you are calling the same URI
* PUT and POST behave the same, if the resource already exists
* POST, without an ID, will create a resource each time it is fired

##### Layered System
Most modern applications are designed using multiple layers, and the same is expected from a RESTful service. In a layered system, each layer is restricted to only seeing or knowing the next layer in the hierarchy.

### SOAP
**Simple Object Access Protocol (SOAP)** is an XML-based messaging protocol for exchanging information among computers. SOAP relies on application layer protocols, most often **Hypertext Transfer Protocol (HTTP)** or **Simple Mail Transfer Protocol (SMTP)**, for message negotiation and transmission.

#### SOAP structure
* Envelope - Mandatory element of SOAP message structure. Defines the start and the end of the message.
* Header - Optional element of the SOAP message. It contains information regarding the SOAP message that can be used to process the data.
* Body - This is the main part, which contains the actual message in XML structure. Obviously, it is a mandatory element.
* Fault - If any errors occur while processing the SOAP message, an optional Fault element can be used to provide information about them.

## Book Code
https://github.com/PacktPublishing/Building-RESTful-Web-Services-with-DOTNET-Core


## Upto
Page 71

Now, we arrive at the point where we need model classes according to the database tables.

Before that: run db.sql to create db schema. But first u must convert the script from sql server to mysql syntax.
