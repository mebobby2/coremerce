# Coremerce

## Prerequites
* .net core (https://dotnet.microsoft.com/download)

## DB Setup
1. Enter mysql console: ```mysql -u root -p```
2. Run command: ```source \path\to\project\db.sql;```

## Install Dependencies
1. ```dotnet restore```

## Run
1. ```dotnet run```
2. Visit: http://localhost:5000/Home.html

## Package Management
To add a package: ```dotnet add package Microsoft.EntityFrameworkCore.SqlServer```

## Generators
* Install scaffold generator: ```dotnet tool install -g dotnet-aspnet-codegenerator```
* Add a model via scaffold: ```dotnet ef dbcontext scaffold "server=localhost;port=3306;user=root;password=password11;database=Coremerce" Pomelo.EntityFrameworkCore.MySql -o Models -t Customers```
* Add a controller: ```dotnet aspnet-codegenerator controller -name CustomersController -actions -api -m Customers -dc CoremerceContext -outDir Controllers```

## C# Notes
### Partial Classes
It provides a special ability to implement the functionality of a single class into multiple files and all these files are combined into a single class file when the application is compiled.

### Var
Local variables can be declared without giving an explicit type. The var keyword instructs the compiler to infer the type of the variable from the expression on the right side of the initialization statement.

### Extension Methods
Extension methods are static methods, which are called as if they were instance methods on the extended type. With Extension methods, you can add methods to existing types without even creating a new derived type, recompiling, or modifying the original type.

```
public static bool IsGreaterThan(this int i, int value)
{
    return i > value;
}

10.IsGreaterThan(100);
```

### Understanding AddDbContext Method Signature
```
AddDbContext<TContext>(IServiceCollection, Action<DbContextOptionsBuilder>, ServiceLifetime, ServiceLifetime)
```

1. It is an extension method (this) that can be used on an IServiceCollection, so the first parameter in this case is services (services.AddDbContext)
2. You can see that the second parameter expects an Action. An action doesn't return anything, it just executes some code.
3. The third & fourth parameter have default values set.

So,
```
services.AddDbContext<CoremerceContext>(options => options.UseMySQL(connection));
```

services is the first parameter and the second parameter is a lambda expression that takes 'options' as a parameter.

### Object Initializer
Object initializers is a quick way to assign values of an object's properties and fields. An object can be initialized without explicitly calling a class's constructor.
```
new StaticFileOptions()
{
    FileProvider = new PhysicalFileProvider(Directory.GetCurrentDirectory())
}
```
is the object initializer form for:
```
StaticFileOptions options = new StaticFileOptions();
options.FileProvider = new PhysicalFileProvider(Directory.GetCurrentDirectory())
```

### Calling base constructor
```
public class MyExceptionClass : Exception
{
    public MyExceptionClass(string message, string extrainfo) : base(message)
    {
        //other stuff here
    }
}
```
A constructor is not something that you can call anytime within a method.

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

### Testing
#### Test Paradigms
When someone is working with a test paradigm, they should know the terms task, scenario, and use case:
* Task - this is an act or piece of work that needs to be completed. There will be different ways to complete the task, but the overall intention with a task is that it should be completed.
* Scenario - Typically, a scenario is nothing but a situation where a system has failed after interaction with a customer. For example, there are a few situations that can cause a system's login functionality to fail, and these will be documented as a scenario. A scenario usually leads to one or more tests.
* Use case - A use case is a set of possible sequences of interactions between a system and a user. It can also be a collection of possible scenarios that should be assessed when a system is implemented. These use cases are more detailed and documented, and are divided into various steps.

#### Bugs and defects
A bug is related to something that is done correctly but executes an unexpected output, for example, 2 + 3 = 6. On the other hand, a defect is something that has been missed during planning. A defect is related to a design or requirements gap that has slipped past a client or customer during production.

#### Test pyramid
* Unit tests: These are tests that test small functionalities in units of an application of RESTful services developed in ASP.NET Core
* RESTful service tests (Acceptance tests): These are tests that test an independent service or a service that communicates with another, often external, service
* These tests belong to the client or consumer who will consume RESTful services; they help in testing an entire system with an aspect of the user interface and are end-to-end tests

#### Security Testing
In general, security testing is a way of testing whether an application is secure or if there is any chance of leaking someone's data.

#### Performance or load testing
* Load testing - This tests the behavior of the system under various circumstances of specific load. This also covers critical transactions, database load, application servers, and so on.
* Stress testing - This is an approach where a system goes under regress testing and finds the upper-limit of a system's capacity. It is also determined by how a system behaves in a critical situation where the current load goes above the expected maximum load.
* Soak testing - This is also known as endurance testing. In this test, the main purpose is to monitor memory utilization, memory leaks, or various factors which affect system performance.
* Spike testing - This is an approach where we make sure that the system is able to sustain the workload. One of the best tasks for determining performance is suddenly increasing the user loads.

### Continuous Integration and Continuous Deployment
#### Continuous Integration
This practice emerged from the problems of the frequent integration of code in large teams. The basic idea is to keep the delta, or change to the software, small. This provides confidence that the software is in a workable state. Even if a check-in made by a developer breaks the system, it is easy to fix it using this process.

#### Continuous Deployment
In CD, each successful build gets deployed to a preferred environment, for example, production. Environments vary from organization to organization. So, CD is not meant for a production environment but you can use it for other environments too like dev, staging, and so on. CD is more important from a technical team's perspective. Under CD, there are several other practices, such as automated unit testing, labeling, versioning of build numbers, and traceability of changes. With continuous delivery, the technical team ensures that the changes pushed to production through various lower environments work as expected in production. Usually, these are small and deployed very quickly.

#### Continuous Delivery
Continuous delivery is different from CD. CD comes from a technical team's perspective, whereas continuous delivery is more focused on providing the deployed code as early as possible to the customer. To make sure that customers get the right defect-free product, in continuous delivery, every build must pass through all the quality assurance checks. Once the product passes the satisfactory quality verification, it is the business stakeholders' decision when to release it.

#### Release
A business feature made available to the end user is referred to as the release of a feature. To release a feature or service, the relevant build artifacts should be deployed beforehand. Usually, the feature toggle manages the release of a feature. If the feature flag (also called the feature toggle) is not switched on in production, it is called a dark release of the specified feature.

#### Prerequisites
* Self-sufficient teams - Amazon, which is a pioneer of SOA and microservice architectures, follows the Two Pizza Teams paradigm. This means usually a microservice team will have no more than 7   10 team members. These team members will have all the necessary skills and roles; for example, development, operations, and business analyst. Such a service team handles the development, operations, and management of a microservice.
* CI and CD - CI and CD are prerequisites for implementing RESTful services that are a part of a system based on a microservices architectural style. Smaller self- sufficient teams, that can integrate their work frequently, are precursors to the success of microservices. This architecture is not as simple as a monolith. However, automation and the ability to push code upgrades regularly enables teams to handle complexity. Tools, such as Team Foundation Online Services (TFS), TeamCity, and Jenkins, are quite popular toolchains in this space.
* Infrastructure as code - The idea of representing hardware and infrastructure components, such as networks with code, is new. It helps you make deployment environments, such as integration, testing, and production, look exactly identical. This means developers and test engineers will be able to reproduce production defects easily in lower environments. With tools such as CFEngine, Chef, Puppet, Ansible, and Powershell DSC, you can write your entire infrastructure as code. With this paradigm shift, you can also put your infrastructure under a version control system and ship it as an artifact in deployment.
* Utilization of cloud-computing - Cloud computing is a big catalyst for adopting microservices. It is not mandatory, as such, for microservice deployment though. Cloud computing comes with a near-infinite scale, elasticity, and rapid provisioning capability. It is a no-brainer that the cloud is a natural ally of microservices. So, knowledge and experience with the Azure cloud will help you adopt microservices.








## Book Code
https://github.com/PacktPublishing/Building-RESTful-Web-Services-with-DOTNET-Core


## Upto
Page 266

Validations
