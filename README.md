# BCalendar 

> BCalendar is a modern application to help enterprises manage its company space.
> With BCalendar it is easy to manage rooms and booking meetings quickly saving time and optimizing your company workflow.

## You can access the blog [HERE]()

## Development Info

![Schema](./app/assets/images/erd.png)

The project is based in 3 models

- User
- Room
- Meetings

Associated to each other as described below:

- A User can have zero or many 
meetings
- A Room can have zero or many meetings
- A Meeting belongs to a user and a room.

## Requested Features

If you're no authenticated User, you can

- Sign Up
- Sign In
- See the Rooms and its calendar.

If you are an authenticated User, you can:

- Create or Delete a Room
- See all the rooms and have access to its calendar
- Make a room reservation in the available periods
- Delete your own reservations.


## Built With

- Ruby v2.7.1
- Ruby on Rails v6.0.3.4
- pg (1.2.3)

## Getting Started

To get a local copy up and running follow these simple example steps.

- Clone this repository
 > `git clone <repo url>`
- Open a terminal on the containing folder of this project
> `cd <folder>`


### Setup

- Install all the dependencies
> `bundle install`

- Iniciate your database running
> `rails db:create`

- Set all the database running

> `rails db:migrate`

### Running tests

This repo contains files to test the validations and associations on models.
You can run the following command on your terminal to run the tests.

> ` rspec .`

or customize them changing the files inside the spec folder.


### Running Locally

- Run the server using the command:

> `rails server`

- Access http://localhost:3000/ in your browser

- Use the navbar links to explore the features (make sure to create a user to have access to all features)


## Authors

👤 **Marilena Roque**

- Github: [MarilenaRoque](https://github.com/MarilenaRoque)
- Twitter: [@MariRoq88285995](https://twitter.com/MariRoq88285995)
- Linkedin: [roquemarilena](https://www.linkedin.com/in/roquemarilena/)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!