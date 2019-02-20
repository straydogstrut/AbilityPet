#  Basic iOS Accessibility

## Introduction
iOS provides a range of features to make apps usable by everyone, including people who experience disabilities, such as the built-in screen reader, VoiceOver, and zoom and Larger Text options. For developers, the Xcode IDE and the Swift programming language provide tools and techniques to ensure our designs are as accessible as possible.

This practical exercise will introduce some of the different accessibility considerations to keep in mind when developing an iOS app. 

## Getting Set Up
You will require the following to complete this exercise:

### System Environment
* iOS device running ##
* macOS device running macOS 10.7 (MacOS 10 X “Lion”) and XCode 4.2
* VoiceOver (built-in to iOS and macOS devices as standard)

### Project Files
* Download the AbilityPet XCode project from GitHub [here](https://github.com/straydogstrut/AbilityPet)

AbilityPet is a simple fictional app that allows users to search for pets to adopt. It’s a single view application with three main viewControllers that includes a tableView, images,  labels and both UIKit and custom controls.

The key areas of interest are:
`PetWelcomeViewController.swift` - Manages the first interactive screen of the app (Welcome) which contains buttons to view the list of pets available, contact the fictional company, and show a modal dialog with more information about AbilityPet.  
`PetListViewController.swift` - Manages a tableView listing the pets available for adoption and their photos, populated from the pets array. The newest arrivals are indicated with a label.  
`PetDetailViewController.swift` - Manages the detail view of a particular pet containing an image of the pet, a Label for the pet name, and textViews with a description and vital statistics. Also contains a button to open an enquiry form and a custom button to like a particular pet.  
`PetCell.swift` - Defines a tableView cell that contains an image and labels for the pet name and location.  
`Pet.swift` - Is the model object representing a pet. It contains properties such as petName, petLocation, petPhoto, and vital statistics such as breed, age and gender.  
`petInfo.plist` - Is a property list containing an array of dictionaries with information about each pet including their name, photo, age, breed, gender and personality.  

## Enabling VoiceOver
VoiceOver is Apple’s award-winning screen reader application and comes as standard on iOS and macOS platforms.  VoiceOver describes what appears on screen, including the content and controls within applications and documents. It allows users to control their Apple computers and portable devices using keyboard shortcuts, refreshable braille displays, touchscreens or trackpads as appropriate.

VoiceOver is enabled and disabled via a toggle button found in the Settings menu under General > Accessibility > VoiceOver.
From the Accessibility menu you can also enable the Accessibility shortcut which will allow easy access to VoiceOver by a triple-click of the Home button. Triple-click of the Home button while VoiceOver is running will turn VoiceOver off.

## Using VoiceOver
Navigation between elements in VoiceOver is achieved by simply swiping on the screen: left swipe previous element, right swipe for the next element.

A single tap identifies the currently focussed element, while a double tap to performs an action. In the case of an App or a link, double tap launches the application or navigates to the linked webpage respectively.

### The Rotor
VoiceOver includes a shortcut menu called the Rotor for quick access to common types of elements and commands. On iOS this is a fly wheel of options while on macOS it is a vertical menu layout.

You can access the Rotor and change the currently selected item by pinching two fingers on screen and turning clockwise or anti-clockwise as if turning an old radio dial.

Options are context sensitive and can include options such as Headers, Landmarks, Form Controls, Links, Words, Characters and speech adjustments amongst others.

Once the relevant option is announced, lift your fingers off the screen to select it. Now, swiping Up or Down will navigate through the selected element type.

The available Rotor commands can be customised by going to Settings > General > Accessibility > VoiceOver > Rotor, then select the options you want to include in the rotor.

### Additional Gestures
VoiceOver on iOS also supports additional gestures that are useful for reading and navigation:
* Two-finger swipe up : Start reading entire webpage
* Two-finger swipe down : Read from current location
* Tap with two fingers : Stop or Resume reading
* Three-finger swipe up or down : Scroll by a page at a time
* Three-finger swipe left or right: Go to next or previous page on the Home Screen
* Three-finger tap :

For more detailed instructions, see the Apple documentation on VoiceOver Gestures.

You can practice VoiceOver gestures by going to **Settings > General > Accessibility > VoiceOver**, then tapping VoiceOver Practice.

## iOS Accessibility Properties and Attributes
The following are some key accessibility properties and attributes that can be set via the Storyboard or in the Swift code for UI elements.

`isAccessibleElement`    Indicates whether an element should be accessible to Assistive Technologies
`accessibilityLabel`    Identifies the element, particularly important where an element does not already display a descriptive text label and for custom controls (e.g. “Volume Up”)
`accessibilityTrait`    Provides a description for an element’s role or helps VoiceOver know how to interact with that element (e.g. accessibilityTraitButton)
`accessibilityHint`    Provides a short description of what interacting with a control will do (e.g. “increases music volume”)

## Reviewing the AbilityPet app
Explore the app using VoiceOver and note the following issues:

* Labelling - Images of pets available are not descriptive
* Hint - The like button on the pet detail page is announced as “heart red” and “heart white” when toggled
* Trait - The Ask About Me button on the pet detail page opens Safari unexpectedly
* Nesting - The “new arrival” icon in the tableView is not announced
* Grouping – Pet attributes and their associated values are read individually (UIAccessibilityElement)
* *Form validation – Error messages on the contact form are not announced by VoiceOver (Label and Hint)*

We will address these in the following sections.

## Addressing the Issues

### Images of pets are not descriptive
Although the images in the tableView and the large images in the petDetailView are exposed to the Accessibility Inspector (and therefore also VoiceOver), they are simply announced based on the file name of the image which is not very descriptive. An `accessibilityLabel` can be set to describe the image for VoiceOver users.

Since these imageViews are populated programmatically, we have to set the accessibilityLabel via code rather than in the Storyboard: 

`petImageView.accessibilityLabel = “Tortoiseshell cat”`

### The like button on the pet detail page is announced as “heart red button” and “heart white button” when toggled
The like button represented by a heart that can be toggled on and off allows users to save pets they’re interested in to revisit later (functionality not built in to this version of the app). However the button is announced as heart red and heart white when toggled. This is because the button has no label so the file name is being read. More than that though, it’s not obvious what action this button performs.
An `accessibilityHint` can be used to describe the result of performing an action on the control. This can be set in the Storyboard under Accessibility > Hint or via code:

`likeButton.accessibilityHint = “Save to favourites”`

### The Ask About Me button opens Safari unexpectedly
The Ask About Me button opens Safari but does not advise the user this is what will happen. An `accessibilityTrait` can be used to describe what action a button will perform. Since this button is acting as a link, it would be more appropriate to give it this trait. This can be set in the Storyboard under **Accessibility > Trait** or via code:

`contactUsButton.accessibilityTrait = UIAccessibilityTraitLink`

### The “new arrival” icon in the tableView is not announced
The “new arrival” label is not announced by VoiceOver when moving between pets in the tableView. Worse, it’s focusable by VoiceOver meaning pets with a “new arrival” label take two swipes to navigate between.

The reason for this is parent views set as accessibility elements hide any child accessibility elements nested inside of them. In this example, the label is inside a parent View. Since both the parent View and Label have Accessibility checked, the label is not accessible to VoiceOver.

We can fix this either by removing the Accessibility enabled tag from the View in the Storyboard inspector or by removing the parent view entirely.

### Pet attributes and their associated values are read individually
Although they are visually associated, pet attributes such as Breed and Age are individual elements to Assistive Technology meaning that VoiceOver reads them separately. Users have to swipe twice to through each pair of attributes, when it would make more sense to hear them read out together.

We can group these items under a parent view, however we know that parent views set as accessibilityElements hide their accessibility children. We can however, combine the labels in an `UIAccessibilityElement` and set this as the `accessibilityLabel` of the parent view:

```
genderStatView.isAccessibilityElement = true // the parent view
genderStatView.accessibilityLabel = "\(petGenderTitle.text!), \(petGenderLabel.text!)" // combine the labels
```

### Error messages on the contact form are not announced by VoiceOver
**TBC**
In the Contact Us screen, when the user tries to submit the form with incomplete fields, error messages are displayed beside each field. However, although visually the errors are associated with their relevant fields, VoiceOver is not aware of this and announces them separately when the users moves through the form.

We can add Labels and Hints to associate these and improve the experience for VoiceOver users.

## Xcode Accessibility Inspector
Xcode comes with the Accessibility Inspector which allows you to identify the accessibility properties of objects under the mouse cursor 
First of all, make sure the Accessibility Inspector has permission to control your computer. Under Security & Privacy > Privacy > Accessibility ensure Accessibility Inspector is added to the list and the checkbox is checked.

To launch the Accessibility Inspector from within Xcode, navigate to **Xcode > Open Developer Tool > Accessibility Inspector**. Once launched, you can also pin the Accessibility Inspector to the Dock for easy access in future.

The accessibility inspector has a toolbar across the top with three areas of interest:

* The dropdown allows you to select the process or application you wish to inspect. If running your app in the Simulator, select the Simulator.

* Enabling the targeting reticule will show you details of the Label, Title, Value and type of controls as you mouse over them. Note that clicking on the simulator itself will deactivate the targeting reticule, however you can use the navigation and Actions buttons within the Accessibility Simulator to simulate touching the screen.

* As well as viewing information about the various controls, the options to the right of the toolbar allow you to perform an audit. This is per screen and – unless you clear the previous audit warnings – will add new warnings to the list of warnings raised.

* The last toolbar option allows you to test other accessibility options such as inverting the colours, reducing transparency and increasing the font size.

Explore the app with the Accessibility Inspector and run an audit on each of the different views. The Accessibility Inspector will highlight the following issues:

* Dynamic Font Sizes are unsupported
* Contrast Failure
* Hit Area insufficient

We will address these in the following sections:

### Dynamic Font Sizes are unsupported
The text in the New Arrival labels is not dynamic and does not resize when the user changes the font size (you can see this by changing the Font Size in the Accessibility Inspector).

We can fix this by choosing **Automatically Adjusts Font** in the attributes Inspector and selecting one of the Font Styles other than the System font styles.

However, you will notice that the New Arrival label does not scale with the font. If using Auto Constraints, we need to set constraints on the top/right of the label, and a resizable leading space. We could also embed the label in another view with constraints to give some padding around the label text.

### Contrast Failure
The Accessibility Inspector is warns that the white text on lighter green background found in the Navigation Bar fails the 4:51 contrast ratio that Apple recommends. Also, although it does not throw a warning in the Inspector, the contrast of white text on darker green of the buttons only passes at 14pt and 18pt font sizes.

To fix this, adjust the font colour or the background colour of the app until the contrast passes. The Color Contrast Calculator found under **Accessibility Inspector > Window > Show Color Contrast Calculator** can be helpful here.

### Hit Area insufficient
The hit area of the alert button is smaller than the recommended 44px in the Apple Developer guidelines. We can fix this by setting the button size to 44px, updating the constraints, and using the UIImageInsets property to resize the image inside to its original size. imageEdgeInsets can be set in the Storyboard or via code:

`alertButton.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)`

## Summary
This exercise has introduced some basic iOS accessibility considerations and suggested Swift and Storyboard options to address these. Key accessibility elements such as Labels, Hints and Traits have been introduced, and tools to confirm support for Dynamic Font Sizes and Contrast Ratios have also been covered.

For more information on Accessibility support in iOS, see the [Apple Developer Documentation](https://developer.apple.com/accessibility/).
