# 🤖 Robot SwagLabs CI/CD Demo

This project demonstrates automated end-to-end testing using **Robot Framework** and **GitHub Actions**, based on a mock e-commerce site called **Swag Labs**.

## 📦 What's Included

- `docs/swag_labs.html`: A demo HTML web app for testing
- `tests/test_swag_labs.robot`: Robot Framework script testing the full user flow
- `.github/workflows/robot-tests.yml`: GitHub Actions pipeline to run tests automatically

## 🧪 Test Flow

The Robot Framework test covers:

1. ✅ Login with valid credentials
2. 🛒 Adding products to the cart
3. 🧹 Removing one item before checkout
4. 🧾 Filling out the checkout form
5. 🎉 Confirming the success message

## 🚀 CI/CD Workflow

Every time code is pushed or a pull request is opened, GitHub Actions:

- Sets up Python
- Installs Robot Framework and SeleniumLibrary
- Runs the Robot test in **headless mode**

## 🌍 Live Test Page

To run the test, this file is served via GitHub Pages:

🔗 [swag_labs.html](https://nethmiig.github.io/robot-swaglabs/swag_labs.html)

Update this URL in `test_swag_labs.robot` if the link changes.

## 📂 Folder Structure

```
robot-swaglabs/
├── docs/
│   └── swag_labs.html
├── tests/
│   └── test_swag_labs.robot
└── .github/
    └── workflows/
        └── robot-tests.yml
```

## 🧠 Reflection

This project was built for a Software Testing & QA course to understand:

- Test automation basics
- CI/CD best practices
- How pipelines help large teams maintain quality

---

Made with ❤️ by **Nethmi Nirasha Gamage**