# Contributing to the `uvadsi` package

Thanks for looking to contribute!

## Process

Check out a [walkthrough below](#walkthrough). For all the wonderful details, check out [R packages by Hadley Wickham](http://r-pkgs.had.co.nz/).

The rough process to contribute to this package (and most open source github repositories) is to:

 * Fork the project
 * Clone locally and create a Feature Branch
 * Make commits (ie, add a new function)
 * Push to your fork
 * Make a pull request back to the original and get it approved.

That's it! Don't forget to add yourself as an author to the `DESCRIPTION` file!

## Requirements

But life can't be all fun and games. A new feature must satisfy a few requirements:

 * Have new code (or data)
 * Proper documentation (roxygen2 comments)
 * Passing test suite with adequate coverage
 * Clean `lintr::lint_package()` and `devtools::check()`

Bug fixes have a similar path. Optionally include a vignette for your code.

## Style

This package will largely follow standard R style found in `lintr` and `formatR`, however the default indentation is 2 spaces. You may use the automation with a command such as `formatR::tidy_dir("./R", indent=2)`

## Tools

To work on a package, you will need the following R packages:

 * `devtools`
 * `testthat`
 * `covr`
 * `lintr`

You can install them by hand or run the following lines once:

```R
if (!require("devtools")) install.packages("devtools")
if (!require("testthat")) install.packages("testthat")
if (!require("covr")) devtools::install_github("jimhester/covr")
if (!require("lintr")) devtools::install_github("jimhester/lintr")
```

# Walkthrough

Step by step, how to contribute a function.

### Step 1 - Fork the Project

Visit [https://github.com/user01/uvadsi](https://github.com/user01/uvadsi) and click the "Fork" button in the upper right.

![Fork this project](assets/fork_button.png "Fork Repo")

### Step 2 - Clone your Fork

You now have a personal copy of `uvadsi` in your github account. Clone that to your local machine (bring the remote copy on to your computer).

Find a directory where you want to work (for example `~/code/r/`), navigate there, and clone your fork. You can find the url under the green Clone/Download button.

![Clone your project](assets/clone_url.png "Clone Repo")


```bash
git clone git@github.com:uvastudent/uvadsi.git
```

You will end up with a new folder containing the repository of the uvadsi package. As per the example, this would be at `~/code/r/uvadsi`.

### Step 3 - Make a Feature Branch

Create a [branch](https://www.atlassian.com/git/tutorials/using-branches) for your new feature. Name this in some way meaningful to your work, such as `cool-new-feature`.

```bash
git checkout -b cool-new-feature
```

### Step 4 - Write Code

Write your code and commit often with helpful messages. [Skip to Checking](#step-6---check-code).

If using RStudio, you can open the `uvadsi.Rproj` and take advantage of the GUI.

All R code goes in the `./R/` folder. Unless you have a fantastic reason otherwise, create a new file called `./R/cool_new_feature_functions.R`. This will contain your working code.

Develop as normal from here. The [packages book](http://r-pkgs.had.co.nz/) goes into more details, but you expose functions by tagging them with special comments. When developing, load libraries into the environment with `library()` without putting that call in the package code. If you need more libraries, be prepared to argue for them and add them to the uvadsi package. See the existing files for templates.

In this example's `./R/even_or_odd_functions.R`, we will use the following code:

```R
even_count_of_elements <- function(v) {
  (length(v) %% 2) == 0
}

even_or_odd <- function(v){
  if (even_count_of_elements(v)) {
    return("Even")
  }
  if (sum(v %% 2 == 0) > 1) {
    return("Even")
  }
  return("Odd")
}
```

This example is (quite) contrived, but will suffice for examples. In particular, the function we want to offer is `even_or_odd`. `even_count_of_elements` is just an internal helper.

### Step 5 - Document Code

Once written, the code must be documented. This is how future developers know what your code does, how RStudio produces help pages, and how this package builds the user manual.

This roxygen2 style of comments is covered in more depth [online](http://r-pkgs.had.co.nz/man.html). Notable is the `#' @export` line, which marks this as an external function for the package. The `#' @examples` will be tested as real code.

This will be exercised in the subsequent sections. For now, just write what you think is helpful to know.

```R
#' Checks if the number of elements in a vector is even or not
#'
#' @param v Vector of any type
#' @return logical TRUE if the vector has an Even length, FALSE otherwise
even_count_of_elements <- function(v) {
  (length(v) %% 2) == 0
}

#' Marks a numeric vector as either Even or Odd
#'
#' If the vector has an even number of elements, then it is always "Even"
#' If the vector has an odd number of elements, but any of them are even
#'  then the result is "Even"
#' Otherwise, the result is "Odd"
#'
#' @param v Vector of numeric type
#' @return character Either "Even" or "Odd"
#' @examples
#' even_or_odd(1:4)
#' even_or_odd(1:3)
#' even_or_odd(1:5)
#' even_or_odd(2:4)
#' even_or_odd(2)
#' @export
even_or_odd <- function(v){
  if (even_count_of_elements(v)) {
    return("Even")
  }
  if (sum(v %% 2 == 0) > 1) {
    return("Even")
  }
  return("Odd")
}
```

### Step 6 - Test Code

All code accepted to this package must have good **test coverage** (check that functions work as desired) and complete **code coverage** (all lines are checked). Both will be done in one step.

Tests are written in with the `testthat` library. Create a new file in the `./tests/testthat/` with an appropriate name. For this example, we will keep convention with `even_or_odd_functions.R`.

Testing is a topic deserving of it's [own chapter](http://r-pkgs.had.co.nz/tests.html), but in short it provides deterministic checks that code is performing as expected. They are organized into test blocks, which can be divided up into like groups.



### Step 7 - Check Code


```R
lintr::lint_package(linters=lintr::default_linters[names(lintr::default_linters) != "object_usage_linter"])
```
