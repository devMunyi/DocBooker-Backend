<a name="readme-top"></a>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [Kanban Board](#kanban_board)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 [DocBooker Backend] <a name="about-project"></a>

> A Ruby on Rails backend created with resources for users, doctors, and reservations, and served as API endpoints to a Frontend client application that enables users to schedule appointments with doctors.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Server</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **[create_user]**
- **[create_doctors]**
- **[create_appointment]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

- [Live Link](https://booking-backend-e3gn.onrender.com/api-docs/index.html)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need following installed:

- Ruby
- Ruby on Rails
- Node

### Setup

You can find the React Frontend client at [React_client](https://github.com/j-tee/front-end-booking-app/tree/development)

Clone this repository to your desired folder:

To run and view this application, you will first have to clone a local version of this repository using:

`git clone https://github.com/j-tee/booking-app.git`

After that navigate to the newly created folder:

`cd booking-app`

### Install

Install this project with:
 `bundle install`

### Usage

- To run the project follow the instructions below:

- You can find the React Frontend client at [React_client](https://github.com/RayhanTabase/hello-react-front-end)

- Configure PostgreSQL database in your project in the project directory:

`config/database.yml`

- Then run the following command to setup the database:
```
rails db:create, rails db:migrate, rails db:seed
```

- Start a local server running the command:

`rails s`


### Run tests

To run tests, run the following command:

```
bundle exec rspec ./spec/requests
bundle exec rspec ./spec/controllers
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Salim Abdulai**

- GitHub: [@RayhanTabase](https://github.com/RayhanTabase)
- LinkedIn: [Salim-Abdulai](https://linkedin.com/in/salim-abdulai-5430065b)

👤 **Samuel**

- GitHub: [@devMunyi](https://github.com/devMunyi)
- LinkedIn: [Samuel Munyi](https://www.linkedin.com/in/samuel-munyi)

👤 **Julius**

- GitHub: [@j-tee](https://github.com/j-tee)
- LinkedIn: [Julius Tetteh](https://www.linkedin.com/in/julius-tetteh)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **[authentication]**
- [ ] **[authorizations]**
- [ ] **[sessions]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

Give a ⭐️ if you like this project!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>
I would like to thank:
- Microverse for providing an excellent curriculum that has helped me enhance my skills in software development.
- Code Reviewers for their valuable feedback and guidance throughout my learning journey.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Kanban Board -->

## Kanban Board <a name="kanban_board"></a>

- [Kanban Board](https://github.com/users/j-tee/projects/5/views/1)

- Team of 3 members

- ![Screenshot](https://user-images.githubusercontent.com/5064641/220668473-0516ef00-93e7-4a4c-a077-ac8cbc5c500a.png)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./MIT.md) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
