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
    PageText("This app provides a course for enhancing understanding of visual theory by introducing and allowing hands-on practice of the Gestalt theory, which is one of the theories in cognitive psychology."),
    PageHeadline("Gestalt Theory", spacing: true),
    PageText("\"Gestalt\" means \"shape, form, structure\" in German. This theory suggests that in the process of human cognition, all elements are not processed independently, but tend to be perceived in an organized structure. This can be summarized as the concept that \"the whole is greater than the sum of its parts.\""),
    PageText("The concepts of Gestalt theory are applied in various fields. For example, in the field of design, researchers study how to optimize human visual perception and create effective designs by utilizing these principles of perception."),
    PageTask("Below is the playground view where you will be soving the callenges.\nPress the button below to see how the main objects you perceive change in shape.", spacing: true),
    PageHeadline("Positive Space & Negative Space", spacing: true),
    PageText("Understanding the concepts of positive and negative space can increase one's understanding of Gestalt theory."),
    PageText("Positive space refers to the space where the main subject or element is located and is generally composed of various visual elements such as color, pattern, texture, line, and form. For example, in the image above, if one recognizes a human face as the main object, the human face could be considered the positive space."),
    PageText("On the other hand, negative space refers to the empty space where the main element is not located and is typically used to emphasize or strengthen the positive space. For example, in the image, the space surrounding the human face could be considered negative space."),
    PageHeadline("🌟 Summary", spacing: true),
    PageText("Positive space is the area where the main object is perceived, while negative space is the empty space surrounding the main object. Where is the positive space and negative space that you perceive in the above challenge?"),
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
    PageText("When perceiving a form, there is a tendency to group visually similar elements together based on attributes such as shape, size, depth, direction, and color. This principle is called the principle of similarity."),
    PageHeadline("Unity", spacing: true),
    PageText("Visual elements that are similar in shape appear to be related or grouped more closely than elements that do not share common attributes. This similarity is referred to as unity, which is the recognition of similar elements as a cohesive whole or sum."),
    PageTask("Select Color, Shape, and Size below to see how each element is grouped in perception.", spacing: true),
    PageHeadline("🌟 Summary", spacing: true),
    PageText("The law of similarity suggests that elements with similar shapes, colors, sizes, textures, and so on are perceived as a group, forming a single pattern."),
    PageText("This is one of the key concepts in Gestalt psychology, which proposes that the perception of elements is not processed independently but rather organized into a structured whole in human cognition."),
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
    PageText("The law of proximity states that elements placed close to each other are perceived as being more related than elements that are farther apart."),
    PageHeadline("Distance", spacing: true),
    PageText("The key factor in the principle of proximity is 'distance'. By making elements closer or farther apart, we can clearly differentiate them into different groups. If the elements are closer, they are perceived as one group, and if they are farther apart, they are perceived as different groups."),
    PageText("For example, if several dots are arranged close to each other, they are perceived as one group. Similarly, if several squares of similar size and color are arranged close to each other, they are perceived as one group."),
    PageText("In design, proximity is used to group related elements together, maintaining harmony and balance between the components or creating emphasis. In art, the principle of proximity is used to control the composition of the artwork or to add emphasis to certain elements."),
    PageTask("Move the slider to observe how the shapes are grouped together.", spacing: true),
    PageHeadline("🌟 Summary", spacing: true),
    PageText("The law of proximity suggests that elements positioned close to each other are perceived as a group, which is an important factor in grouping and pattern recognition for humans."),
    PageText("In other words, humans tend to perceive elements that are located close together as a single unit, and this is one of the important factors in grouping and pattern formation.")
  ]
)

let commonFate = Page(
  id: "common_fate",
  title: "Common Fate",
  contentSubTitle: "Lesson 3",
  contentTitle: "The Law of Common Fate",
  titleIconName: "chart.bar",
  playgroundView: .commonFatePlaygroundView,
  elements: [
    PageText("The Law of Common Fate refers to the perception of grouping objects that move in the same direction."),
    PageHeadline("Unified directionality", spacing: true),
    PageText("When elements on the screen share the same direction, they appear to be unified, creating a sense of coherence and allowing viewers to focus on the cause of the motion. In other words, the Law of Common Fate enables us to perceive a unified directionality and to recognize elements that are moving together as a single cohesive group."),
    PageTask("Tap the screen to observe the elements moving in the same direction!", spacing: true),
    PageHeadline("🌟 Summary", spacing: true),
    PageText("The Law of Common Fate suggests that we perceive elements that move in the same direction as a collective unit and perceive them as one factor."),
  ]
)

let closure = Page(
  id: "closure",
  title: "Closure",
  contentSubTitle: "Lesson 4",
  contentTitle: "The Law of Closure",
  titleIconName: "moonphase.waning.crescent",
  playgroundView: .closurePlaygroundView,
  elements: [
    PageHeadline("Imagination", spacing: true),
    PageText("We have a tendency to imagine the missing parts of an object to perceive it as a whole. This is where the Law of Closure comes into play. This habit occurs when what we see or perceive partially matches the object, even if some information is missing."),
             PageText("Our brains have a built-in tendency to view things as whole and flawless, and we unconsciously use our imagination to fill in any missing pieces or gaps in our perception. This process occurs unconsciously."),
    PageTask("Press the button to make 6 shapes appear. Observe what shape is formed in the completed pattern.", spacing: true),
    PageHeadline("🌟 Summary", spacing: true),
    PageText("The law of closure is a core principle of Gestalt theory and a visual perceptual principle where the mind unconsciously seeks to perceive incomplete forms as complete forms, thus creating consistency and coherence out of objectively inconsistent parts."),
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
    PageText("Congratulations on making it this far! You have learned about four principles of Gestalt theory. You have learned a visual theory and expanded your perspective. Below is a quiz to test what you have learned."),
    PageTask("Check what you have learned and finish the final quiz on the right.", spacing: true),
    PageText("Thank you for taking the time to experience this app. I hope you had a fun and enriching learning experience through this app. \nI wish for your vision to continue expanding!", spacing: true),
  ]
)
