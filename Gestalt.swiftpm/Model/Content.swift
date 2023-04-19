import SwiftUI

let lessons : [Page] = [welcome, similarity, proximity, commonFate, closure, quiz]

enum PlaygroundViews {
  case welcomePlaygroundView
  case similarityPlaygroundView
  case proximityPlaygroundView
  case commonFatePlaygroundView
  case closurePlaygroundView
  case quizPlaygroundView
}

let welcome = Page(
  id: "basics_welcome",
  title: "Introduction",
  contentSubTitle: "Welcome",
  contentTitle: "Gestalt Theory",
  titleIconName: "hand.wave",
  playgroundView: .welcomePlaygroundView,
  elements: [
    PageText("게슈탈트 이론입니다요."),
    PageTask("게슈탈트 첫 챌린지 문장입니다요.", spacing: true),
    PageHeadline("헤딩1", spacing: true),
    PageText("본문본문"),
    PageHeadline("헤딩2", spacing: true),
    PageText("본문본문"),
  ]
)

let similarity = Page(
  id: "basics_hierarchy",
  title: "Similarity",
  contentSubTitle: "Lesson 1",
  contentTitle: "The Law of Similarity",
  titleIconName: "allergens",
  playgroundView: .similarityPlaygroundView,
  elements: [
    PageText("Good typography lets readers easily understand the semantics of different paragraphs in a layout. We use hierarchy to achieve that desired effect."),
    PageHeadline("Font sizes", spacing: true),
    PageText("The first option to create hierarchy is the font size. The larger the font of a paragraph the more dominant and important it will appear. Make sure that you choose a consistent system of sizes which allows easy distinction. A good rule of thumb is to double the size for the next higher hierarchy."),
    PageText("Keep in mind that we also pursue the goal of making text greatly readable, so don't choose too small font sizes. For body text, go for a point size larger than 13 pixels for digital and 10 points for print."),
    PageHeadline("Font styles", spacing: true),
    PageText("You probably already know that fonts can have different weights. Thin, Regular or Semibold just to name a few. In addition to working with different font sizes, you can also use these weights to create hierarchy and empathise different paragraphs. Whenever you use more than one style of a font, make sure to skip a weight, otherwise, the difference between those two weights is too subtle. You can for example choose a combination of thin and medium, if there is a regular in between."),
    PageTask("The news app on the right currently lacks a clear hierarchy. The problem is the headline, adjust the font size and weight to fix that.", spacing: true),
    PageHeadline("Summary", spacing: true),
    PageText("For screens use Sans Serif and for print use Serif fonts. Stick to one font for a project and prefer well-established typefaces."),
  ]
)

let proximity = Page(
  id: "proximity",
  title: "Proximity",
  contentSubTitle: "Lesson 2",
  contentTitle: "The Law of Proximity",
  titleIconName: "rectangle.grid.1x2",
  playgroundView: .proximityPlaygroundView,
  elements: [
    PageText("For this last lesson, we will take a look at something more advanced in typography, kerning and tracking of letters and fonts."),
    PageHeadline("Make space", spacing: true),
    PageText("Both kerning and tracking improve the appearance and design of your text by adding or subtracting space between specific pairs of characters. With kerning, you can change the space between two characters and tracking changes the spacing of the whole paragraph. Adjust the tracking with great caution, as too much and too little can make reading a lot more difficult."),
    PageTask("Set the font size to about 60 px and then adjust the tracking to let the word appear a bit more spaced out.", spacing: true),
    PageHeadline("Summary", spacing: true),
    PageText("You can improve the readability of a font by adjusting its tracking. With kerning, you can change the distance between individual characters, that's often used for perfecting largely visible headlines."),
  ]
)

let commonFate = Page(
  id: "common_fate",
  title: "Common Fate",
  contentSubTitle: "Lesson 4",
  contentTitle: "The Law of Common Fate",
  titleIconName: "chart.bar",
  playgroundView: .commonFatePlaygroundView,
  elements: [
    PageText("For this last lesson, we will take a look at something more advanced in typography, kerning and tracking of letters and fonts."),
    PageHeadline("Make space", spacing: true),
    PageText("Both kerning and tracking improve the appearance and design of your text by adding or subtracting space between specific pairs of characters. With kerning, you can change the space between two characters and tracking changes the spacing of the whole paragraph. Adjust the tracking with great caution, as too much and too little can make reading a lot more difficult."),
    PageTask("Set the font size to about 60 px and then adjust the tracking to let the word appear a bit more spaced out.", spacing: true),
    PageHeadline("Summary", spacing: true),
    PageText("You can improve the readability of a font by adjusting its tracking. With kerning, you can change the distance between individual characters, that's often used for perfecting largely visible headlines."),
  ]
)

let closure = Page(
  id: "closure",
  title: "Closure",
  contentSubTitle: "Lesson 5",
  contentTitle: "The Law of Closure",
  titleIconName: "moonphase.waning.crescent",
  playgroundView: .closurePlaygroundView,
  elements: [
    PageText("For this last lesson, we will take a look at something more advanced in typography, kerning and tracking of letters and fonts."),
    PageHeadline("Make space", spacing: true),
    PageText("Both kerning and tracking improve the appearance and design of your text by adding or subtracting space between specific pairs of characters. With kerning, you can change the space between two characters and tracking changes the spacing of the whole paragraph. Adjust the tracking with great caution, as too much and too little can make reading a lot more difficult."),
    PageTask("Set the font size to about 60 px and then adjust the tracking to let the word appear a bit more spaced out.", spacing: true),
    PageHeadline("Summary", spacing: true),
    PageText("You can improve the readability of a font by adjusting its tracking. With kerning, you can change the distance between individual characters, that's often used for perfecting largely visible headlines."),
  ]
)

let quiz = Page(
  id: "basics_quiz", 
  title: "Final Quiz",
  contentSubTitle: "Final Quiz",
  contentTitle: "Check your knowledge",
  titleIconName: "brain",
  playgroundView: .quizPlaygroundView,
  elements: [
    PageText("Congratulations for making it that far! You've made your way through some of the most fundamental rules of typography, had the chance to apply them and now have a head start in typography. There's one last challenge for you that will put to the test, what you have learned."),
    PageTask("Check what you have learned and finish the final quiz on the right.", spacing: true),
    PageText("Thank you for taking the time to complete this course, I hope you enjoyed it and that you've learned something new. Have a great WWDC, see you there!", spacing: true),
  ]
)
