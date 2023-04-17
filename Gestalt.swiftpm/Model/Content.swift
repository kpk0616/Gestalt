import SwiftUI

// This file contains all content that app displays, organized with Pages
let BasicsCourse : [Page] = [welcome, similarity, proximity, commonFate, closure, quiz]

/// All avalible PlaygroundViews that PageContentView can darw
/// The switch case in PageContentView must cover that case for a view to appear
enum PlaygroundViews {
  case welcomePlaygroundView
  case similarityPlaygroundView
  case proximityPlaygroundView
  case continuancePlaygroundView
  case commonFatePlaygroundView
  case closurePlaygroundView
  case quizPlaygroundView
}

/// All avalible ContentCustomView that PageContentView can darw
/// The switch case in PageContentView must cover that case for a view to appear
enum ContentCustomView {
  case fontsContentCustomView
}

let welcome = Page(
  id: "basics_welcome",
  title: "Welcome",
  contentSubTitle: "Welcome",
  contentTitle: "Gestalt Theory Basics Course",
  titleImageName: "hand.wave",
  playgroundView: .welcomePlaygroundView,
  elements: [
    PageText("게슈탈트 이론입니다요."),
    PageTask("게슈탈트 첫 챌린지 문장입니다요.", topSpacing: true),
    PageHeadline("헤딩1", topSpacing: true),
    PageText("본문본문"),
    PageDivider(topSpacing: true),
    PageHeadline("헤딩2", topSpacing: true),
    PageText("본문본문"),
  ]
)

let similarity = Page(
  id: "basics_hierarchy",
  title: "Similarity",
  contentSubTitle: "Lesson 2",
  contentTitle: "The Law of Similarity",
  titleImageName: "circle.grid.2x1",
  playgroundView: .similarityPlaygroundView,
  elements: [
    PageText("Good typography lets readers easily understand the semantics of different paragraphs in a layout. We use hierarchy to achieve that desired effect."),
    PageHeadline("Font sizes", topSpacing: true),
    PageText("The first option to create hierarchy is the font size. The larger the font of a paragraph the more dominant and important it will appear. Make sure that you choose a consistent system of sizes which allows easy distinction. A good rule of thumb is to double the size for the next higher hierarchy."),
    PageText("Keep in mind that we also pursue the goal of making text greatly readable, so don't choose too small font sizes. For body text, go for a point size larger than 13 pixels for digital and 10 points for print."),
    PageDivider(topSpacing: true),
    PageHeadline("Font styles", topSpacing: true),
    PageText("You probably already know that fonts can have different weights. Thin, Regular or Semibold just to name a few. In addition to working with different font sizes, you can also use these weights to create hierarchy and empathise different paragraphs. Whenever you use more than one style of a font, make sure to skip a weight, otherwise, the difference between those two weights is too subtle. You can for example choose a combination of thin and medium, if there is a regular in between."),
    PageTask("The news app on the right currently lacks a clear hierarchy. The problem is the headline, adjust the font size and weight to fix that.", topSpacing: true),
    PageHeadline("Summary", topSpacing: true),
    PageText("For screens use Sans Serif and for print use Serif fonts. Stick to one font for a project and prefer well-established typefaces."),
  ]
)

let proximity = Page(
  id: "proximity",
  title: "Proximity",
  contentSubTitle: "Lesson 3",
  contentTitle: "The Law of Proximity",
  titleImageName: "rectangle.grid.1x2",
  playgroundView: .proximityPlaygroundView,
  elements: [
    PageText("For this last lesson, we will take a look at something more advanced in typography, kerning and tracking of letters and fonts."),
    PageHeadline("Make space", topSpacing: true),
    PageText("Both kerning and tracking improve the appearance and design of your text by adding or subtracting space between specific pairs of characters. With kerning, you can change the space between two characters and tracking changes the spacing of the whole paragraph. Adjust the tracking with great caution, as too much and too little can make reading a lot more difficult."),
    PageTask("Set the font size to about 60 px and then adjust the tracking to let the word appear a bit more spaced out.", topSpacing: true),
    PageHeadline("Summary", topSpacing: true),
    PageText("You can improve the readability of a font by adjusting its tracking. With kerning, you can change the distance between individual characters, that's often used for perfecting largely visible headlines."),
  ]
)

let continuance = Page(
  id: "continuance",
  title: "Continuance",
  contentSubTitle: "Lesson 4",
  contentTitle: "The Law of Continuance",
  titleImageName: "staroflife.fill",
  playgroundView: .continuancePlaygroundView,
  elements: [
    PageText("continuance"),
    PageHeadline("헤딩1", topSpacing: true),
    PageText("본문1"),
    PageTask("챌린지!", topSpacing: true),
    PageHeadline("Summary", topSpacing: true),
    PageText("본문2"),
  ]
)

let commonFate = Page(
  id: "common_fate",
  title: "Common Fate",
  contentSubTitle: "Lesson 5",
  contentTitle: "The Law of Common Fate",
  titleImageName: "chart.bar",
  playgroundView: .commonFatePlaygroundView,
  elements: [
    PageText("For this last lesson, we will take a look at something more advanced in typography, kerning and tracking of letters and fonts."),
    PageHeadline("Make space", topSpacing: true),
    PageText("Both kerning and tracking improve the appearance and design of your text by adding or subtracting space between specific pairs of characters. With kerning, you can change the space between two characters and tracking changes the spacing of the whole paragraph. Adjust the tracking with great caution, as too much and too little can make reading a lot more difficult."),
    PageTask("Set the font size to about 60 px and then adjust the tracking to let the word appear a bit more spaced out.", topSpacing: true),
    PageHeadline("Summary", topSpacing: true),
    PageText("You can improve the readability of a font by adjusting its tracking. With kerning, you can change the distance between individual characters, that's often used for perfecting largely visible headlines."),
  ]
)

let closure = Page(
  id: "closure",
  title: "Closure",
  contentSubTitle: "Lesson 6",
  contentTitle: "The Law of Closure",
  titleImageName: "moonphase.waning.crescent",
  playgroundView: .closurePlaygroundView,
  elements: [
    PageText("For this last lesson, we will take a look at something more advanced in typography, kerning and tracking of letters and fonts."),
    PageHeadline("Make space", topSpacing: true),
    PageText("Both kerning and tracking improve the appearance and design of your text by adding or subtracting space between specific pairs of characters. With kerning, you can change the space between two characters and tracking changes the spacing of the whole paragraph. Adjust the tracking with great caution, as too much and too little can make reading a lot more difficult."),
    PageTask("Set the font size to about 60 px and then adjust the tracking to let the word appear a bit more spaced out.", topSpacing: true),
    PageHeadline("Summary", topSpacing: true),
    PageText("You can improve the readability of a font by adjusting its tracking. With kerning, you can change the distance between individual characters, that's often used for perfecting largely visible headlines."),
  ]
)

let quiz = Page(
  id: "basics_quiz", 
  title: "Final Quiz",
  contentSubTitle: "Final Quiz",
  contentTitle: "Check your knowledge",
  titleImageName: "brain.head.profile",
  playgroundView: .quizPlaygroundView,
  elements: [
    PageText("Congratulations for making it that far! You've made your way through some of the most fundamental rules of typography, had the chance to apply them and now have a head start in typography. There's one last challenge for you that will put to the test, what you have learned."),
    PageTask("Check what you have learned and finish the final quiz on the right.", topSpacing: true),
    PageDivider(topSpacing: true),
    PageText("Thank you for taking the time to complete this course, I hope you enjoyed it and that you've learned something new. Have a great WWDC, see you there!", topSpacing: true),
  ]
)

/*
 
 // not included yet
 let DemoPageContent = Page(
 id: "basics_alignment",
 title: "Alignment",
 contentSubTitle: "Lesson 2",
 contentTitle: "Left align text",
 titleImageName: "align.horizontal.left.fill",
 playgroundView: .appPlaygroundView,
 elements: [
 PageText("For a perciese typography would want to align text to a signel line, perferrably the leeft alignment."),
 PageHeadline("Attention", topSpacing: true),
 PageText("If you design for a right to left language, you should right align the text"),
 PageTask("On the right you will see a typographic news app with a poor usage of alignment.", subTasks: ["Take some time to experiment, how diffrent combinations feel", "Use the controls below to fix the aligmentens"]),
 PageDivider(),
 PageHeadline("Break the rules", topSpacing: false),
 PageText("There can always be situations, in wich a centerd alignment is more appropriete, you can always do that, but when i doubt, left align your text."),
 ]
 )
 
 // not inclueded
 let MorePage = Page(
 id: "basics_contrast",
 title: "Contrast",
 contentSubTitle: "Lesson 4",
 contentTitle: "The secret to fonts is use just one",
 titleImageName: "circle.lefthalf.filled",
 playgroundView: .kerningPlaygroundView,
 elements: [
 PageHeadline("Introduction to Fonts", topSpacing: true),
 PageText("Fonts are the foundational building block of every tyograhphy work. Typograyh is making art with letters, and yes, thats art too!"),
 PageTask("Be happy", subTasks: ["Whats good?"])
 ]
 )
 
 */
