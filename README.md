Some Guidance for Writing alt text for Data Plots
================
Krisanat Anukarnsakulchularp and Di Cook

<!-- README.md is generated from README.Rmd. Please edit that file -->

## Why?

Alt text provides a textual alternative to non-text content in HTML
documents. It serves various purposes:

- it is necessary for accessibility guidelines.
- ensures your data visualisations communicate to everybody.
- assistive technologies can convert alt text into other formats such as
  speech or Braille, providing a description for people using screen
  reading software.
- alt text is displayed in place of the figure if it fails to load, or
  is viewed in a text-based browser.
- alt text can assist both general and image-specific search engines.

## Ingredients for writing alt text

The purpose of alt text is to describe what is in a plot for a person
who cannot see it. Generally, this means very basic explanation of the
elements of the plots. You wouldn’t typically interpret the plot,
especially if it is also accompanied by a caption. A caption assumes
that a person can see the plot, and provides additional context about
why it is included and what is the most important thing to learn. Thus,
the role of alt text is to provide the details of the plot elements for
someone unable to see it, which would help to make the caption also more
understandable. When a caption doesn’t exist, then the alt text has to
play both roles.

The basic ingredients for alt text are:

- What kind of visualization is it (line graph, scatter plot, bar
  chart…)?
- What variables are on the axes?
- What is the range of the data?
- What is the aspect ratio.
- How are variables mapped to elements such as points, lines, violins or
  boxplots?
- What are the visible patterns (points are clustered in the top left
  and bottom right, lots of variability in size of the boxes of the
  boxplots, violins show a bimodal pattern, …) without interpreting
  them.

## Examples

The examples are organised to show what would be written for some common
plots, in both `alt text` and a `caption`. Below is one example, shown
with different additions, and there are more examples available in the
[Examples](https://numbats.github.io/alt-text-for-data-plots/example.html)
page.

### Static scatterplot

The plot is generated from this code.

``` r
library(ggplot2)
library(palmerpenguins)
p <- penguins |>  
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm, 
             color = species)) + 
  geom_point() +
  scale_x_continuous(breaks = seq(13, 22, 2)) +
  scale_y_continuous(breaks = seq(30, 60, 10)) +
  theme(aspect.ratio = 1)
p
```

<img src="figures/README-penguins-1.png" alt="A scatter plot of the penguin's data from the palmerpenguin package. The plot has a bill depth (30 to 60mm) on the x-axis and a bill length (13 to 22 mm) on the y-axis. There are three species of penguins with different colour codes, Adelie (red), Chinstrap (green), and Gentoo (blue). The Gentoo penguins have an elliptical shape pointing to the top right, with the bill length ranging from 40 to 60 mm and bill depth ranging from 13 to 17.5 mm. The Adelie penguins have an elliptical shape pointing to the top right, with the bill length ranging from 15 to 22 mm and bill depth ranging from 30 to 48 mm. The Chinstrap has an elliptical shape pointing to the top right, with the bill length ranging from 40 to 60 mm and bill depth ranging from 16 to 22 mm." width="60%" />

**Alt text:** A scatter plot of the penguin’s data from the
palmerpenguin package. The plot has a bill depth (30 to 60mm) on the
x-axis and a bill length (13 to 22 mm) on the y-axis. There are three
species of penguins with different colour codes, Adelie (red), Chinstrap
(green), and Gentoo (blue). The Gentoo penguins have an elliptical shape
pointing to the top right, with the bill length ranging from 40 to 60 mm
and bill depth ranging from 13 to 17.5 mm. The Adelie penguins have an
elliptical shape pointing to the top right, with the bill length ranging
from 15 to 22 mm and bill depth ranging from 30 to 48 mm. The Chinstrap
has an elliptical shape pointing to the top right, with the bill length
ranging from 40 to 60 mm and bill depth ranging from 16 to 22 mm.

**Caption:** Examining the differences in bill sizes of three species of
penguins. Colour indicates species. Gentoo bills are smaller in depth
but longer. Chinstrap and Adelie bills have similarly large depth but
Chinstrap bills are longer.

There are more examples available in the
[Examples](https://numbats.github.io/alt-text-for-data-plots/example.html)
page.

## Using BrailleR to partially auto-generate

The [BrailleR](http://ajrgodfrey.github.io/BrailleR/index.html) package
provides a text description of a plot that is generated using
[ggplot2](https://ggplot2.tidyverse.org). Here is the description
generated for the plot shown above.

``` r
library(BrailleR)
VI(p)
## This is an untitled chart with no subtitle or caption.
## It has x-axis 'bill_depth_mm' with labels 13, 15, 17, 19 and 21.
## It has y-axis 'bill_length_mm' with labels 40, 50 and 60.
## There is a legend indicating colour is used to show species, with 3 levels:
## Adelie shown as strong reddish orange colour, 
## Chinstrap shown as vivid yellowish green colour and 
## Gentoo shown as brilliant blue colour.
## The chart is a set of 342 big solid circle points of which about 95% can be seen.
```

This is focused on how the plot is constructed, which matches half of
the content. Note that, there are differences to the alt text we
manually wrote. The missing part is the description of the patterns in
the plot that can be seen. This is very difficult to automate. Thus the
BrailleR package can provide a start to the alt text but additional
information needs to be added.

## Resources

There are many sites describing the purpose of writing alt text. None
provides concrete explanations of documenting data plots. Here is our
list of general resources related to alt text:

- [Liz Hare’s
  presentation](https://lizharedogs.github.io/RLadiesNYAltText/#6)
- [Amy Cesal’s Medium
  Post](https://medium.com/nightingale/writing-alt-text-for-data-visualization-2a218)
- [Matt Russell’s blog post on the BrailleR
  package](https://arbor-analytics.com/post/2023-06-30-making-r-graphs-more-accessible-using-brailler/)
- [WCAG 2 Overview](https://www.w3.org/WAI/standards-guidelines/wcag/)
- [WCAG 2.2
  Techniques](https://www.w3.org/WAI/WCAG22/Techniques/html/H69.html)
- [The DAISY Consortium](https://daisy.org)
- [latest guidelines](https://www.w3.org/TR/maturity-model/)

## How to contribute

We welcome contributions! If you have a suggestion or addition please
post this as an
[issue](https://github.com/numbats/alt-text-for-data-plots/issues) on
GitHub.
