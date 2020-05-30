"
! Realtime Hand Detection with TensorFlow and OpenCV

In this chanpter we describe different approaches to hand detection and present our final selected method.

!! Related work

GestureMusicPlayer  (*https://github.com/antnieszka/GestureMusicPlayer*)  is an experimental hand detection project with an aim to control a music player using hand gestures. The algorithm relies on a difference in lighting between hand and the background behind it to perform a thresholding on a grayscale version of an original image frame captured from a WebCam. The presented usage example assumes that the background is darker than a hand. Moreover hand is the only presented object within a frame.

handtracking (*https://github.com/victordibia/handtracking*) is a Real-time Hand-Detection using Neural Networks (SSD) on Tensorflow. Its goal is to detect and track hands in a video stream. The result of the hand detection is a rectangle that represents an approximate area on a picture with a hand.

!! Process
At first, to detect a hand in a picture we tried to rely solely on OpenCV (*https://opencv.org*)and its image processing capabilities. An approach similar to GestureMusicPlayer seemed to be a good starting point. The algorithm can be split in the following steps:

# Get image from camera
# Convert to grayscale
# Blur the image to reduce noise (details of the image are not important)
# Use threshold (low pass filter) to get black and white image
# Analyze the received shape to find convex hull/convexity defects

!! Getting an image frame

The first step is to capture a frame from a live camera stream. For the sake of this document we took a non-modified static frame from an iSight webcam integrated into a MacBook Pro:

${example:GtOpenCVHandDetection>>#handImage|previewShow=gtPreviewFor:|noCode}$

Once frame is captured and stored in the memory we can start an actual hand detection. At first, we tried to rely solely on Computer Vision and *https://opencv.org* and its image processing capabilities to detect a hand in a picture.

!!! Grayscale with a threshold

Let's convert an input frame to a greyscale image in which the value of each pixel is a single sample representing only an amount of light, that is, it carries only intensity information:

${example:GtOpenCVHandDetection>>#grayscale|previewShow=gtPreviewFor:|noCode}$

To eliminate noise and unnecessary artifacts we apply a gaussian blur on a grayscale version of the original image:

${example:GtOpenCVHandDetection>>#grayscaleSmoothed|previewShow=gtPreviewFor:|noCode}$


!! Thresholding

To detect contours in an image we should first convert it to a binary (black and white) image based on some threshold value that defines the magnitude or intensity of light that must be exceeded by a pixel for it to become white, otherwise it turns black.

!!! Global thresholding

The simplest approach would be to manually and statically define a threshold value for the whole image. This method is called Global thresholding. In the GestureMusicPlayer the value is set to 127. Using that value for our picture results in the following black and white version:

${example:GtOpenCVHandDetection>>#blackAndWhite127|previewShow=gtPreviewFor:|noCode}$


As one can see, the hand is not perfectly distinct from the background and we still have noise to the right of it. Manually adjusting the threshold value to 170 gives us a much better result:

${example:GtOpenCVHandDetection>>#blackAndWhite170|previewShow=gtPreviewFor:|noCode}$

However, it means that we should adjust the value each time the environment or hand position changes as it is very difficult to predict the lighting conditions. Another problem of using a Global Thresholding method is that it relies only on one parameter, which is light intensity. If background or some other part of the picture is lit up similarly to the hand we will not be able to find a threshold value that would make it possible to separate hand from other objects or background.

!!! Adaptive thresholding

Instead of defining a threshold globally for the whole image we can use individual values for each segment of the picture. This method is called Adaptive thresholding. It gives better results for images with varying illumination, which is a case in real life scenarios (*https://docs.opencv.org/3.4.0/d7/d4d/tutorial_py_thresholding.html*):

${example:GtOpenCVHandDetection>>#blackAndWhiteAdaptive|previewShow=gtPreviewFor:|noCode}$


However, it does not help us as the details in the foreground and background are still present and it is not realistic to extract a hand's shape from such image.

!!! Otsu's method

Another way to solve the problem of a statically defined threshold is to use more advanced adaptive threshold methods, in particular Otsu's method (*https://en.wikipedia.org/wiki/Otsu%27s_method*). The algorithm assumes that the image contains two classes of pixels following bi-modal histogram (foreground pixels and background pixels), it then calculates the optimum threshold separating the two classes so that their combined spread (intra-class variance) is minimal, or equivalently (because the sum of pairwise squared distances is constant), so that their inter-class variance is maximal.

${example:GtOpenCVHandDetection>>#blackAndWhiteOtsu|previewShow=gtPreviewFor:|noCode}$

Unfortunately, the composition of the original image is quite complex, hence the Otsu's method can not properly differentiate foreground from the background. It also comes from the fact that there are a lot of other details in the image and the hand contour can not be reliably extracted from the image. Therefore we should find a way to crop the frame so that only hand remains. To accomplish this we can use object detection and classification capabilities of neural networks.

!! Neural Networks (SSD) on Tensorflow.

TensorFlow (*https://www.tensorflow.org*) is a powerful tool and framework for object detection and recognition. Hand tracking is one of its applications: *https://github.com/victordibia/handtracking*. The ==handtracking== project focuses on hand detection in an image. It can be used to find an area with a hand so that we can crop the image accordignly. The neural network model that we used is provided by ==victordibia== (*https://github.com/victordibia/*).

Let's use it to detect hands on the original image frame:

${example:GtOpenCVHandDetection>>#hands|previewShow=gtPreviewFor:|noCode}$


The neural network successfully detected a hand which is highlighted with a cyan rectangle. In this particular case the detection score is 100% even though the background behind the hand has different colors. However, the area detection is not absolutely precise, which means we can not simply crop the image based on that and we should use a slightly wider rectangle which is computed out of the area given by the neural network:

${example:GtOpenCVHandDetection>>#hand|previewShow=gtPreviewFor:|noCode}$


One of the limitations of this neural network model is inability to tell the shape of the hand, for example how many fingers user shows at the given time. Therefore we have to go back to additionally using Computer Vision to detect an actual shape of the hand. Compared to analysing the whole image frame it is much more efficient and robust to process a cropped image where hand occupies most of the space and is in fact the largest object in the scene. However, we still have to face the problems related to thresholding and contour detection as previously described.

!!! HSV color space with sking color

Since we are able to crop a part of the image with a hand on it we can improve thresholding by utilizing the following hand properties. Hand is located in the middle of the image, hand occupies most of the space and it is the largest object and skin color is same across the whole hand. HSV (hue, saturation, value) color space can be used to threshold an image based on the color rather than the lightness. To do so we first convert an image to HSV:

${example:GtOpenCVHandDetection>>#hsv|previewShow=gtPreviewFor:|noCode}$

and smooth it out with the help of a Gaussian Blur:

${example:GtOpenCVHandDetection>>#hsvSmoothed|previewShow=gtPreviewFor:|noCode}$


To detect a skin color we select a rectangle of size (image extent / 4) and compute the mean color of all pixels within that rectangle. In our case the color is as follows:

${example:GtOpenCVHandDetection>>#skinColor|previewShow=gtPreviewFor:|noCode}$

!!! Extracting the mean

Once we know the skin color of the hand in a frame we can transform an image into a binary version be making all pixels within a skin color range white and the rest leave black:

${example:GtOpenCVHandDetection>>#mask|previewShow=gtPreviewFor:|noCode}$


However, because contour detection algorithm detects black shapes on a white background we should invert the image by swapping black and white colors:

${example:GtOpenCVHandDetection>>#maskInverted|previewShow=gtPreviewFor:|noCode}$


!!! Contour detection

At this point we are ready to run a contour finding algorithm which gives us a list of detected contours that are marked with a cyan color:

${example:GtOpenCVHandDetection>>#contours|previewShow=gtPreviewFor:|noCode}$


Note that there can be multiple contours inside of the hand, therefore we should select the one that goes around the whole hand. Since we know that the hand is the largest object in the cropped image we find the largest contour based on the area: 

${example:GtOpenCVHandDetection>>#contour|previewShow=gtPreviewFor:|noCode}$


To count how many fingers a user shows we should analyse the shape of the contour and count how many cavities there are in an object. Such cavities are called convexity defects. To do so we first build a convex hull of the largest contour:

${example:GtOpenCVHandDetection>>#convexHull|previewShow=gtPreviewFor:|noCode}$


and then use that convex hull to find convexity defects, marked with red dashed lines:

${example:GtOpenCVHandDetection>>#defects|previewShow=gtPreviewFor:|noCode}$


As soon as we got the first collection of convexity defects it became clear that it is not enough to say that the amount of fingers is equal to amount of defects plus one, because there are some defects that are not related to fingers and come from the rest of the hand or from actual form defects due to the image thresholding. However, human hand and fingers have some unique properties that we can rely on to select only interesting defects:

# The angle between fingers is < 90 degrees
# Fingers point up
# Fingers are long

Let's first select defects with an angle less than 90 degrees:

${example:GtOpenCVHandDetection>>#defectsLessThan90|previewShow=gtPreviewFor:|noCode}$

And then choose only those defects whose cavity is below the anchor points:

${example:GtOpenCVHandDetection>>#defectsPointingUp|previewShow=gtPreviewFor:|noCode}$


As the last but not least step we count the amount of convexity defects that match finger properties and after adding one we get the amount of fingers shown by the user: ${example:GtOpenCVHandDetection>>#amountOfFingers|label=#printString}$

"
Class {
	#name : #GtOpenCVHandDetection,
	#superclass : #Object,
	#category : #'GT4OpenCV-Hand Detection'
}

{ #category : #examples }
GtOpenCVHandDetection >> amountOfFingers [
	<gtExample>
	^ self defectsPointingUp size + 1
]

{ #category : #examples }
GtOpenCVHandDetection >> blackAndWhite127 [
	<gtExample>
	^ self grayscaleSmoothed threshold: 127 
]

{ #category : #examples }
GtOpenCVHandDetection >> blackAndWhite170 [
	<gtExample>
	^ self grayscaleSmoothed threshold: 170 
]

{ #category : #examples }
GtOpenCVHandDetection >> blackAndWhiteAdaptive [
	<gtExample>
	^ self grayscaleSmoothed adaptiveThreshold
]

{ #category : #examples }
GtOpenCVHandDetection >> blackAndWhiteOtsu [
	<gtExample>
	^ self grayscaleSmoothed otsuThreshold
]

{ #category : #examples }
GtOpenCVHandDetection >> contour [
	<gtExample>
	^ self contours max
]

{ #category : #examples }
GtOpenCVHandDetection >> contours [
	<gtExample>
	^ self maskInverted contours
]

{ #category : #examples }
GtOpenCVHandDetection >> convexHull [
	<gtExample>
	^ self contour convexHull
]

{ #category : #examples }
GtOpenCVHandDetection >> defects [
	<gtExample>
	^ self convexHull defects
]

{ #category : #examples }
GtOpenCVHandDetection >> defectsLessThan90 [
	<gtExample>
	^ self defects select: [ :each | each angle < 90 ]
]

{ #category : #examples }
GtOpenCVHandDetection >> defectsPointingUp [
	<gtExample>
	^ self defectsLessThan90 select: [ :each | each isUp ].
]

{ #category : #examples }
GtOpenCVHandDetection >> grayscale [
	<gtExample>
	^ self handImage toGray
]

{ #category : #examples }
GtOpenCVHandDetection >> grayscaleSmoothed [
	<gtExample>
	^ self grayscale gaussianBlur: 25@25 
]

{ #category : #examples }
GtOpenCVHandDetection >> hand [
	<gtExample>
	^ self handImage crop: (self hands anyOne wideArea).
]

{ #category : #examples }
GtOpenCVHandDetection >> handImage [
	<gtExample>
	^ GtOpenCVImage fromFileNamed: ((GtResourcesUtility resourceAtPath: 'feenkcom/gt4opencv/pictures/hand.jpg') fullName).
]

{ #category : #examples }
GtOpenCVHandDetection >> hands [
	<gtExample>
	^ GtTensorFlowHandDetector detect: self handImage.
]

{ #category : #examples }
GtOpenCVHandDetection >> hsv [
	<gtExample>
	^ self hand toHSV.
]

{ #category : #examples }
GtOpenCVHandDetection >> hsvSmoothed [
	<gtExample>
	^ self hsv gaussianBlur: 25@25.
]

{ #category : #examples }
GtOpenCVHandDetection >> mask [
	<gtExample>
	^ self hsvSmoothed extractMean expandBy: 10.
]

{ #category : #examples }
GtOpenCVHandDetection >> maskInverted [
	<gtExample>
	^ self mask inverted.
]

{ #category : #examples }
GtOpenCVHandDetection >> skinColor [
	<gtExample>
	^ self hsvSmoothed extractMeanColor
]
