//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSRekognitionResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSRekognitionResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSRekognitionResources

+ (instancetype)sharedInstance {
    static AWSRekognitionResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSRekognitionResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2016-06-27\",\
    \"endpointPrefix\":\"rekognition\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon Rekognition\",\
    \"serviceId\":\"Rekognition\",\
    \"signatureVersion\":\"v4\",\
    \"targetPrefix\":\"RekognitionService\",\
    \"uid\":\"rekognition-2016-06-27\"\
  },\
  \"operations\":{\
    \"CompareFaces\":{\
      \"name\":\"CompareFaces\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CompareFacesRequest\"},\
      \"output\":{\"shape\":\"CompareFacesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>Compares a face in the <i>source</i> input image with each of the 100 largest faces detected in the <i>target</i> input image. </p> <note> <p> If the source image contains multiple faces, the service detects the largest face and compares it with each face detected in the target image. </p> </note> <p>You pass the input and target images either as base64-encoded image bytes or as a references to images in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p> <p>In response, the operation returns an array of face matches ordered by similarity score in descending order. For each face match, the response provides a bounding box of the face, facial landmarks, pose details (pitch, role, and yaw), quality (brightness and sharpness), and confidence value (indicating the level of confidence that the bounding box contains a face). The response also provides a similarity score, which indicates how closely the faces match. </p> <note> <p>By default, only faces with a similarity score of greater than or equal to 80% are returned in the response. You can change this value by specifying the <code>SimilarityThreshold</code> parameter.</p> </note> <p> <code>CompareFaces</code> also returns an array of faces that don't match the source image. For each face, it returns a bounding box, confidence value, landmarks, pose details, and quality. The response also returns information about the face in the source image, including the bounding box of the face and confidence value.</p> <p>If the image doesn't contain Exif metadata, <code>CompareFaces</code> returns orientation information for the source and target images. Use these values to display the images with the correct image orientation.</p> <p>If no faces are detected in the source or target images, <code>CompareFaces</code> returns an <code>InvalidParameterException</code> error. </p> <note> <p> This is a stateless API operation. That is, data returned by this operation doesn't persist.</p> </note> <p>For an example, see <a>faces-compare-images</a>.</p> <p>This operation requires permissions to perform the <code>rekognition:CompareFaces</code> action.</p>\"\
    },\
    \"CreateCollection\":{\
      \"name\":\"CreateCollection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateCollectionRequest\"},\
      \"output\":{\"shape\":\"CreateCollectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"}\
      ],\
      \"documentation\":\"<p>Creates a collection in an AWS Region. You can add faces to the collection using the operation. </p> <p>For example, you might create collections, one for each of your application users. A user can then index faces using the <code>IndexFaces</code> operation and persist results in a specific collection. Then, a user can search the collection for faces in the user-specific container. </p> <note> <p>Collection names are case-sensitive.</p> </note> <p>This operation requires permissions to perform the <code>rekognition:CreateCollection</code> action.</p>\"\
    },\
    \"CreateStreamProcessor\":{\
      \"name\":\"CreateStreamProcessor\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateStreamProcessorRequest\"},\
      \"output\":{\"shape\":\"CreateStreamProcessorResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates an Amazon Rekognition stream processor that you can use to detect and recognize faces in a streaming video.</p> <p>Rekognition Video is a consumer of live video from Amazon Kinesis Video Streams. Rekognition Video sends analysis results to Amazon Kinesis Data Streams.</p> <p>You provide as input a Kinesis video stream (<code>Input</code>) and a Kinesis data stream (<code>Output</code>) stream. You also specify the face recognition criteria in <code>Settings</code>. For example, the collection containing faces that you want to recognize. Use <code>Name</code> to assign an identifier for the stream processor. You use <code>Name</code> to manage the stream processor. For example, you can start processing the source video by calling with the <code>Name</code> field. </p> <p>After you have finished analyzing a streaming video, use to stop processing. You can delete the stream processor by calling .</p>\"\
    },\
    \"DeleteCollection\":{\
      \"name\":\"DeleteCollection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteCollectionRequest\"},\
      \"output\":{\"shape\":\"DeleteCollectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified collection. Note that this operation removes all faces in the collection. For an example, see <a>delete-collection-procedure</a>.</p> <p>This operation requires permissions to perform the <code>rekognition:DeleteCollection</code> action.</p>\"\
    },\
    \"DeleteFaces\":{\
      \"name\":\"DeleteFaces\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteFacesRequest\"},\
      \"output\":{\"shape\":\"DeleteFacesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Deletes faces from a collection. You specify a collection ID and an array of face IDs to remove from the collection.</p> <p>This operation requires permissions to perform the <code>rekognition:DeleteFaces</code> action.</p>\"\
    },\
    \"DeleteStreamProcessor\":{\
      \"name\":\"DeleteStreamProcessor\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteStreamProcessorRequest\"},\
      \"output\":{\"shape\":\"DeleteStreamProcessorResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p>Deletes the stream processor identified by <code>Name</code>. You assign the value for <code>Name</code> when you create the stream processor with . You might not be able to use the same name for a stream processor for a few seconds after calling <code>DeleteStreamProcessor</code>.</p>\"\
    },\
    \"DescribeStreamProcessor\":{\
      \"name\":\"DescribeStreamProcessor\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeStreamProcessorRequest\"},\
      \"output\":{\"shape\":\"DescribeStreamProcessorResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p>Provides information about a stream processor created by . You can get information about the input and output streams, the input parameters for the face recognition being performed, and the current status of the stream processor.</p>\"\
    },\
    \"DetectFaces\":{\
      \"name\":\"DetectFaces\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectFacesRequest\"},\
      \"output\":{\"shape\":\"DetectFacesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>Detects faces within an image that is provided as input.</p> <p> <code>DetectFaces</code> detects the 100 largest faces in the image. For each face detected, the operation returns face details including a bounding box of the face, a confidence value (that the bounding box contains a face), and a fixed set of attributes such as facial landmarks (for example, coordinates of eye and mouth), gender, presence of beard, sunglasses, etc. </p> <p>The face-detection algorithm is most effective on frontal faces. For non-frontal or obscured faces, the algorithm may not detect the faces or might detect faces with lower confidence. </p> <p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p> <note> <p>This is a stateless API operation. That is, the operation does not persist any data.</p> </note> <p>For an example, see <a>procedure-detecting-faces-in-images</a>.</p> <p>This operation requires permissions to perform the <code>rekognition:DetectFaces</code> action. </p>\"\
    },\
    \"DetectLabels\":{\
      \"name\":\"DetectLabels\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectLabelsRequest\"},\
      \"output\":{\"shape\":\"DetectLabelsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>Detects instances of real-world entities within an image (JPEG or PNG) provided as input. This includes objects like flower, tree, and table; events like wedding, graduation, and birthday party; and concepts like landscape, evening, and nature. For an example, see <a>images-s3</a>.</p> <note> <p> <code>DetectLabels</code> does not support the detection of activities. However, activity detection is supported for label detection in videos. For more information, see .</p> </note> <p>You pass the input image as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p> <p> For each object, scene, and concept the API returns one or more labels. Each label provides the object name, and the level of confidence that the image contains the object. For example, suppose the input image has a lighthouse, the sea, and a rock. The response will include all three labels, one for each object. </p> <p> <code>{Name: lighthouse, Confidence: 98.4629}</code> </p> <p> <code>{Name: rock,Confidence: 79.2097}</code> </p> <p> <code> {Name: sea,Confidence: 75.061}</code> </p> <p> In the preceding example, the operation returns one label for each of the three objects. The operation can also return multiple labels for the same object in the image. For example, if the input image shows a flower (for example, a tulip), the operation might return the following three labels. </p> <p> <code>{Name: flower,Confidence: 99.0562}</code> </p> <p> <code>{Name: plant,Confidence: 99.0562}</code> </p> <p> <code>{Name: tulip,Confidence: 99.0562}</code> </p> <p>In this example, the detection algorithm more precisely identifies the flower as a tulip.</p> <p>In response, the API returns an array of labels. In addition, the response also includes the orientation correction. Optionally, you can specify <code>MinConfidence</code> to control the confidence threshold for the labels returned. The default is 50%. You can also add the <code>MaxLabels</code> parameter to limit the number of labels returned. </p> <note> <p>If the object detected is a person, the operation doesn't provide the same facial details that the <a>DetectFaces</a> operation provides.</p> </note> <p>This is a stateless API operation. That is, the operation does not persist any data.</p> <p>This operation requires permissions to perform the <code>rekognition:DetectLabels</code> action. </p>\"\
    },\
    \"DetectModerationLabels\":{\
      \"name\":\"DetectModerationLabels\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectModerationLabelsRequest\"},\
      \"output\":{\"shape\":\"DetectModerationLabelsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>Detects explicit or suggestive adult content in a specified JPEG or PNG format image. Use <code>DetectModerationLabels</code> to moderate images depending on your requirements. For example, you might want to filter images that contain nudity, but not images containing suggestive content.</p> <p>To filter images, use the labels returned by <code>DetectModerationLabels</code> to determine which types of content are appropriate. For information about moderation labels, see <a>moderation</a>.</p> <p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p>\"\
    },\
    \"DetectText\":{\
      \"name\":\"DetectText\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectTextRequest\"},\
      \"output\":{\"shape\":\"DetectTextResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>Detects text in the input image and converts it into machine-readable text.</p> <p>Pass the input image as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, you must pass it as a reference to an image in an Amazon S3 bucket. For the AWS CLI, passing image bytes is not supported. The image must be either a .png or .jpeg formatted file. </p> <p>The <code>DetectText</code> operation returns text in an array of elements, <code>TextDetections</code>. Each <code>TextDetection</code> element provides information about a single word or line of text that was detected in the image. </p> <p>A word is one or more ISO basic latin script characters that are not separated by spaces. <code>DetectText</code> can detect up to 50 words in an image.</p> <p>A line is a string of equally spaced words. A line isn't necessarily a complete sentence. For example, a driver's license number is detected as a line. A line ends when there is no aligned text after it. Also, a line ends when there is a large gap between words, relative to the length of the words. This means, depending on the gap between words, Amazon Rekognition may detect multiple lines in text aligned in the same direction. Periods don't represent the end of a line. If a sentence spans multiple lines, the <code>DetectText</code> operation returns multiple lines.</p> <p>To determine whether a <code>TextDetection</code> element is a line of text or a word, use the <code>TextDetection</code> object <code>Type</code> field. </p> <p>To be detected, text must be within +/- 30 degrees orientation of the horizontal axis.</p> <p>For more information, see <a>text-detection</a>.</p>\"\
    },\
    \"GetCelebrityInfo\":{\
      \"name\":\"GetCelebrityInfo\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetCelebrityInfoRequest\"},\
      \"output\":{\"shape\":\"GetCelebrityInfoResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Gets the name and additional information about a celebrity based on his or her Rekognition ID. The additional information is returned as an array of URLs. If there is no additional information about the celebrity, this list is empty. For more information, see <a>get-celebrity-info-procedure</a>.</p> <p>This operation requires permissions to perform the <code>rekognition:GetCelebrityInfo</code> action. </p>\"\
    },\
    \"GetCelebrityRecognition\":{\
      \"name\":\"GetCelebrityRecognition\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetCelebrityRecognitionRequest\"},\
      \"output\":{\"shape\":\"GetCelebrityRecognitionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets the celebrity recognition results for a Rekognition Video analysis started by .</p> <p>Celebrity recognition in a video is an asynchronous operation. Analysis is started by a call to which returns a job identifier (<code>JobId</code>). When the celebrity recognition operation finishes, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartCelebrityRecognition</code>. To get the results of the celebrity recognition analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetCelebrityDetection</code> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartCelebrityDetection</code>. For more information, see <a>video</a>.</p> <p> <code>GetCelebrityRecognition</code> returns detected celebrities and the time(s) they are detected in an array (<code>Celebrities</code>) of objects. Each <code>CelebrityRecognition</code> contains information about the celebrity in a object and the time, <code>Timestamp</code>, the celebrity was detected. </p> <p>By default, the <code>Celebrities</code> array is sorted by time (milliseconds from the start of the video). You can also sort the array by celebrity by specifying the value <code>ID</code> in the <code>SortBy</code> input parameter.</p> <p>The <code>CelebrityDetail</code> object includes the celebrity identifer and additional information urls. If you don't store the additional information urls, you can get them later by calling with the celebrity identifer.</p> <p>No information is returned for faces not recognized as celebrities.</p> <p>Use MaxResults parameter to limit the number of labels returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetCelebrityDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetCelebrityRecognition</code>.</p>\"\
    },\
    \"GetContentModeration\":{\
      \"name\":\"GetContentModeration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetContentModerationRequest\"},\
      \"output\":{\"shape\":\"GetContentModerationResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets the content moderation analysis results for a Rekognition Video analysis started by .</p> <p>Content moderation analysis of a video is an asynchronous operation. You start analysis by calling . which returns a job identifier (<code>JobId</code>). When analysis finishes, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartContentModeration</code>. To get the results of the content moderation analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetCelebrityDetection</code> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartCelebrityDetection</code>. For more information, see <a>video</a>. </p> <p> <code>GetContentModeration</code> returns detected content moderation labels, and the time they are detected, in an array, <code>ModerationLabels</code>, of objects. </p> <p>By default, the moderated labels are returned sorted by time, in milliseconds from the start of the video. You can also sort them by moderated label by specifying <code>NAME</code> for the <code>SortBy</code> input parameter. </p> <p>Since video analysis can return a large number of results, use the <code>MaxResults</code> parameter to limit the number of labels returned in a single call to <code>GetContentModeration</code>. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetContentModeration</code> and populate the <code>NextToken</code> request parameter with the value of <code>NextToken</code> returned from the previous call to <code>GetContentModeration</code>.</p> <p>For more information, see <a>moderation</a>.</p>\"\
    },\
    \"GetFaceDetection\":{\
      \"name\":\"GetFaceDetection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetFaceDetectionRequest\"},\
      \"output\":{\"shape\":\"GetFaceDetectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets face detection results for a Rekognition Video analysis started by .</p> <p>Face detection with Rekognition Video is an asynchronous operation. You start face detection by calling which returns a job identifier (<code>JobId</code>). When the face detection operation finishes, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartFaceDetection</code>. To get the results of the face detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceDetection</code>.</p> <p> <code>GetFaceDetection</code> returns an array of detected faces (<code>Faces</code>) sorted by the time the faces were detected. </p> <p>Use MaxResults parameter to limit the number of labels returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetFaceDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetFaceDetection</code>.</p>\"\
    },\
    \"GetFaceSearch\":{\
      \"name\":\"GetFaceSearch\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetFaceSearchRequest\"},\
      \"output\":{\"shape\":\"GetFaceSearchResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets the face search results for Rekognition Video face search started by . The search returns faces in a collection that match the faces of persons detected in a video. It also includes the time(s) that faces are matched in the video.</p> <p>Face search in a video is an asynchronous operation. You start face search by calling to which returns a job identifier (<code>JobId</code>). When the search operation finishes, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartFaceSearch</code>. To get the search results, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetFaceSearch</code> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceSearch</code>. For more information, see <a>collections</a>.</p> <p>The search results are retured in an array, <code>Persons</code>, of objects. Each<code>PersonMatch</code> element contains details about the matching faces in the input collection, person information for the matched person, and the time the person was matched in the video.</p> <p>By default, the <code>Persons</code> array is sorted by the time, in milliseconds from the start of the video, persons are matched. You can also sort by persons by specifying <code>INDEX</code> for the <code>SORTBY</code> input parameter.</p>\"\
    },\
    \"GetLabelDetection\":{\
      \"name\":\"GetLabelDetection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetLabelDetectionRequest\"},\
      \"output\":{\"shape\":\"GetLabelDetectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets the label detection results of a Rekognition Video analysis started by . </p> <p>The label detection operation is started by a call to which returns a job identifier (<code>JobId</code>). When the label detection operation finishes, Amazon Rekognition publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartlabelDetection</code>. To get the results of the label detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartLabelDetection</code>.</p> <p> <code>GetLabelDetection</code> returns an array of detected labels (<code>Labels</code>) sorted by the time the labels were detected. You can also sort by the label name by specifying <code>NAME</code> for the <code>SortBy</code> input parameter.</p> <p>The labels returned include the label name, the percentage confidence in the accuracy of the detected label, and the time the label was detected in the video.</p> <p>Use MaxResults parameter to limit the number of labels returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetlabelDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetLabelDetection</code>.</p>\"\
    },\
    \"GetPersonTracking\":{\
      \"name\":\"GetPersonTracking\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetPersonTrackingRequest\"},\
      \"output\":{\"shape\":\"GetPersonTrackingResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets the person tracking results of a Rekognition Video analysis started by .</p> <p>The person detection operation is started by a call to <code>StartPersonTracking</code> which returns a job identifier (<code>JobId</code>). When the person detection operation finishes, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartPersonTracking</code>.</p> <p>To get the results of the person tracking operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartPersonTracking</code>.</p> <p> <code>GetPersonTracking</code> returns an array, <code>Persons</code>, of tracked persons and the time(s) they were tracked in the video. </p> <p>By default, the array is sorted by the time(s) a person is tracked in the video. You can sort by tracked persons by specifying <code>INDEX</code> for the <code>SortBy</code> input parameter.</p> <p>Use the <code>MaxResults</code> parameter to limit the number of items returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetPersonTracking</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetPersonTracking</code>.</p>\"\
    },\
    \"IndexFaces\":{\
      \"name\":\"IndexFaces\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"IndexFacesRequest\"},\
      \"output\":{\"shape\":\"IndexFacesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>Detects faces in the input image and adds them to the specified collection. </p> <p>Amazon Rekognition does not save the actual faces detected. Instead, the underlying detection algorithm first detects the faces in the input image, and for each face extracts facial features into a feature vector, and stores it in the back-end database. Amazon Rekognition uses feature vectors when performing face match and search operations using the and operations.</p> <p>If you are using version 1.0 of the face detection model, <code>IndexFaces</code> indexes the 15 largest faces in the input image. Later versions of the face detection model index the 100 largest faces in the input image. To determine which version of the model you are using, check the the value of <code>FaceModelVersion</code> in the response from <code>IndexFaces</code>. For more information, see <a>face-detection-model</a>.</p> <p>If you provide the optional <code>ExternalImageID</code> for the input image you provided, Amazon Rekognition associates this ID with all faces that it detects. When you call the operation, the response returns the external ID. You can use this external image ID to create a client-side index to associate the faces with each image. You can then use the index to find all faces in an image. </p> <p>In response, the operation returns an array of metadata for all detected faces. This includes, the bounding box of the detected face, confidence value (indicating the bounding box contains a face), a face ID assigned by the service for each face that is detected and stored, and an image ID assigned by the service for the input image. If you request all facial attributes (using the <code>detectionAttributes</code> parameter, Amazon Rekognition returns detailed facial attributes such as facial landmarks (for example, location of eye and mount) and other facial attributes such gender. If you provide the same image, specify the same collection, and use the same external ID in the <code>IndexFaces</code> operation, Amazon Rekognition doesn't save duplicate face metadata. </p> <p>The input image is passed either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p> <p>This operation requires permissions to perform the <code>rekognition:IndexFaces</code> action.</p>\"\
    },\
    \"ListCollections\":{\
      \"name\":\"ListCollections\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListCollectionsRequest\"},\
      \"output\":{\"shape\":\"ListCollectionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns list of collection IDs in your account. If the result is truncated, the response also provides a <code>NextToken</code> that you can use in the subsequent request to fetch the next set of collection IDs.</p> <p>For an example, see <a>list-collection-procedure</a>.</p> <p>This operation requires permissions to perform the <code>rekognition:ListCollections</code> action.</p>\"\
    },\
    \"ListFaces\":{\
      \"name\":\"ListFaces\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListFacesRequest\"},\
      \"output\":{\"shape\":\"ListFacesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns metadata for faces in the specified collection. This metadata includes information such as the bounding box coordinates, the confidence (that the bounding box contains a face), and face ID. For an example, see <a>list-faces-in-collection-procedure</a>. </p> <p>This operation requires permissions to perform the <code>rekognition:ListFaces</code> action.</p>\"\
    },\
    \"ListStreamProcessors\":{\
      \"name\":\"ListStreamProcessors\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListStreamProcessorsRequest\"},\
      \"output\":{\"shape\":\"ListStreamProcessorsResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of stream processors that you have created with . </p>\"\
    },\
    \"RecognizeCelebrities\":{\
      \"name\":\"RecognizeCelebrities\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RecognizeCelebritiesRequest\"},\
      \"output\":{\"shape\":\"RecognizeCelebritiesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidImageFormatException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>Returns an array of celebrities recognized in the input image. For more information, see <a>celebrities</a>. </p> <p> <code>RecognizeCelebrities</code> returns the 100 largest faces in the image. It lists recognized celebrities in the <code>CelebrityFaces</code> array and unrecognized faces in the <code>UnrecognizedFaces</code> array. <code>RecognizeCelebrities</code> doesn't return celebrities whose faces are not amongst the largest 100 faces in the image.</p> <p>For each celebrity recognized, the <code>RecognizeCelebrities</code> returns a <code>Celebrity</code> object. The <code>Celebrity</code> object contains the celebrity name, ID, URL links to additional information, match confidence, and a <code>ComparedFace</code> object that you can use to locate the celebrity's face on the image.</p> <p>Rekognition does not retain information about which images a celebrity has been recognized in. Your application must store this information and use the <code>Celebrity</code> ID property as a unique identifier for the celebrity. If you don't store the celebrity name or additional information URLs returned by <code>RecognizeCelebrities</code>, you will need the ID to identify the celebrity in a call to the operation.</p> <p>You pass the imput image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p> <p>For an example, see <a>celebrities-procedure-image</a>.</p> <p>This operation requires permissions to perform the <code>rekognition:RecognizeCelebrities</code> operation.</p>\"\
    },\
    \"SearchFaces\":{\
      \"name\":\"SearchFaces\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SearchFacesRequest\"},\
      \"output\":{\"shape\":\"SearchFacesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>For a given input face ID, searches for matching faces in the collection the face belongs to. You get a face ID when you add a face to the collection using the <a>IndexFaces</a> operation. The operation compares the features of the input face with faces in the specified collection. </p> <note> <p>You can also search faces without indexing faces by using the <code>SearchFacesByImage</code> operation.</p> </note> <p> The operation response returns an array of faces that match, ordered by similarity score with the highest similarity first. More specifically, it is an array of metadata for each face match that is found. Along with the metadata, the response also includes a <code>confidence</code> value for each face match, indicating the confidence that the specific face matches the input face. </p> <p>For an example, see <a>search-face-with-id-procedure</a>.</p> <p>This operation requires permissions to perform the <code>rekognition:SearchFaces</code> action.</p>\"\
    },\
    \"SearchFacesByImage\":{\
      \"name\":\"SearchFacesByImage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SearchFacesByImageRequest\"},\
      \"output\":{\"shape\":\"SearchFacesByImageResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>For a given input image, first detects the largest face in the image, and then searches the specified collection for matching faces. The operation compares the features of the input face with faces in the specified collection. </p> <note> <p> To search for all faces in an input image, you might first call the operation, and then use the face IDs returned in subsequent calls to the operation. </p> <p> You can also call the <code>DetectFaces</code> operation and use the bounding boxes in the response to make face crops, which then you can pass in to the <code>SearchFacesByImage</code> operation. </p> </note> <p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p> <p> The response returns an array of faces that match, ordered by similarity score with the highest similarity first. More specifically, it is an array of metadata for each face match found. Along with the metadata, the response also includes a <code>similarity</code> indicating how similar the face is to the input face. In the response, the operation also returns the bounding box (and a confidence level that the bounding box contains a face) of the face that Amazon Rekognition used for the input image. </p> <p>For an example, see <a>search-face-with-image-procedure</a>.</p> <p>This operation requires permissions to perform the <code>rekognition:SearchFacesByImage</code> action.</p>\"\
    },\
    \"StartCelebrityRecognition\":{\
      \"name\":\"StartCelebrityRecognition\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartCelebrityRecognitionRequest\"},\
      \"output\":{\"shape\":\"StartCelebrityRecognitionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"VideoTooLargeException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Starts asynchronous recognition of celebrities in a stored video.</p> <p>Rekognition Video can detect celebrities in a video must be stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartCelebrityRecognition</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the analysis. When celebrity recognition analysis is finished, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. To get the results of the celebrity recognition analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartCelebrityRecognition</code>. For more information, see <a>celebrities</a>.</p>\",\
      \"idempotent\":true\
    },\
    \"StartContentModeration\":{\
      \"name\":\"StartContentModeration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartContentModerationRequest\"},\
      \"output\":{\"shape\":\"StartContentModerationResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"VideoTooLargeException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p> Starts asynchronous detection of explicit or suggestive adult content in a stored video.</p> <p>Rekognition Video can moderate content in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartContentModeration</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the analysis. When content moderation analysis is finished, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>.</p> <p>To get the results of the content moderation analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartContentModeration</code>. For more information, see <a>moderation</a>.</p>\",\
      \"idempotent\":true\
    },\
    \"StartFaceDetection\":{\
      \"name\":\"StartFaceDetection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartFaceDetectionRequest\"},\
      \"output\":{\"shape\":\"StartFaceDetectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"VideoTooLargeException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Starts asynchronous detection of faces in a stored video.</p> <p>Rekognition Video can detect faces in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartFaceDetection</code> returns a job identifier (<code>JobId</code>) that you use to get the results of the operation. When face detection is finished, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. To get the results of the label detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceDetection</code>. For more information, see <a>faces-video</a>.</p>\",\
      \"idempotent\":true\
    },\
    \"StartFaceSearch\":{\
      \"name\":\"StartFaceSearch\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartFaceSearchRequest\"},\
      \"output\":{\"shape\":\"StartFaceSearchResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"VideoTooLargeException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Starts the asynchronous search for faces in a collection that match the faces of persons detected in a stored video.</p> <p>The video must be stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartFaceSearch</code> returns a job identifier (<code>JobId</code>) which you use to get the search results once the search has completed. When searching is finished, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. To get the search results, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceSearch</code>. For more information, see <a>collections-search-person</a>.</p>\",\
      \"idempotent\":true\
    },\
    \"StartLabelDetection\":{\
      \"name\":\"StartLabelDetection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartLabelDetectionRequest\"},\
      \"output\":{\"shape\":\"StartLabelDetectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"VideoTooLargeException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Starts asynchronous detection of labels in a stored video.</p> <p>Rekognition Video can detect labels in a video. Labels are instances of real-world entities. This includes objects like flower, tree, and table; events like wedding, graduation, and birthday party; concepts like landscape, evening, and nature; and activities like a person getting out of a car or a person skiing.</p> <p>The video must be stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartLabelDetection</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the operation. When label detection is finished, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>.</p> <p>To get the results of the label detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartLabelDetection</code>.</p> <p/>\",\
      \"idempotent\":true\
    },\
    \"StartPersonTracking\":{\
      \"name\":\"StartPersonTracking\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartPersonTrackingRequest\"},\
      \"output\":{\"shape\":\"StartPersonTrackingResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"VideoTooLargeException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Starts the asynchronous tracking of persons in a stored video.</p> <p>Rekognition Video can track persons in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartPersonTracking</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the operation. When label detection is finished, Amazon Rekognition publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. </p> <p>To get the results of the person detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartPersonTracking</code>.</p>\",\
      \"idempotent\":true\
    },\
    \"StartStreamProcessor\":{\
      \"name\":\"StartStreamProcessor\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartStreamProcessorRequest\"},\
      \"output\":{\"shape\":\"StartStreamProcessorResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p>Starts processing a stream processor. You create a stream processor by calling . To tell <code>StartStreamProcessor</code> which stream processor to start, use the value of the <code>Name</code> field specified in the call to <code>CreateStreamProcessor</code>.</p>\"\
    },\
    \"StopStreamProcessor\":{\
      \"name\":\"StopStreamProcessor\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopStreamProcessorRequest\"},\
      \"output\":{\"shape\":\"StopStreamProcessorResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p>Stops a running stream processor that was created by .</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AccessDeniedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You are not authorized to perform the action.</p>\",\
      \"exception\":true\
    },\
    \"AgeRange\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Low\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>The lowest estimated age.</p>\"\
        },\
        \"High\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>The highest estimated age.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Structure containing the estimated age range, in years, for a face.</p> <p>Rekognition estimates an age-range for faces detected in the input image. Estimated age ranges can overlap; a face of a 5 year old may have an estimated range of 4-6 whilst the face of a 6 year old may have an estimated range of 4-8.</p>\"\
    },\
    \"Attribute\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DEFAULT\",\
        \"ALL\"\
      ]\
    },\
    \"Attributes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Attribute\"}\
    },\
    \"Beard\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the face has beard or not.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the face has a beard, and the confidence level in the determination.</p>\"\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"BoundingBox\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Width\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Width of the bounding box as a ratio of the overall image width.</p>\"\
        },\
        \"Height\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Height of the bounding box as a ratio of the overall image height.</p>\"\
        },\
        \"Left\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Left coordinate of the bounding box as a ratio of overall image width.</p>\"\
        },\
        \"Top\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Top coordinate of the bounding box as a ratio of overall image height.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifies the bounding box around the object, face or text. The <code>left</code> (x-coordinate) and <code>top</code> (y-coordinate) are coordinates representing the top and left sides of the bounding box. Note that the upper-left corner of the image is the origin (0,0). </p> <p>The <code>top</code> and <code>left</code> values returned are ratios of the overall image size. For example, if the input image is 700x200 pixels, and the top-left coordinate of the bounding box is 350x50 pixels, the API returns a <code>left</code> value of 0.5 (350/700) and a <code>top</code> value of 0.25 (50/200).</p> <p>The <code>width</code> and <code>height</code> values represent the dimensions of the bounding box as a ratio of the overall image dimension. For example, if the input image is 700x200 pixels, and the bounding box width is 70 pixels, the width returned is 0.1. </p> <note> <p> The bounding box coordinates can have negative values. For example, if Amazon Rekognition is able to detect a face that is at the image edge and is only partially visible, the service can return coordinates that are outside the image bounds and, depending on the image edge, you might get negative values or values greater than 1 for the <code>left</code> or <code>top</code> values. </p> </note>\"\
    },\
    \"Celebrity\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Urls\":{\
          \"shape\":\"Urls\",\
          \"documentation\":\"<p>An array of URLs pointing to additional information about the celebrity. If there is no additional information about the celebrity, this list is empty.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the celebrity.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"RekognitionUniqueId\",\
          \"documentation\":\"<p>A unique identifier for the celebrity. </p>\"\
        },\
        \"Face\":{\
          \"shape\":\"ComparedFace\",\
          \"documentation\":\"<p>Provides information about the celebrity's face, such as its location on the image.</p>\"\
        },\
        \"MatchConfidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The confidence, in percentage, that Rekognition has that the recognized face is the celebrity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a celebrity recognized by the operation.</p>\"\
    },\
    \"CelebrityDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Urls\":{\
          \"shape\":\"Urls\",\
          \"documentation\":\"<p>An array of URLs pointing to additional celebrity information. </p>\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the celebrity.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"RekognitionUniqueId\",\
          \"documentation\":\"<p>The unique identifier for the celebrity. </p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The confidence, in percentage, that Amazon Rekognition has that the recognized face is the celebrity. </p>\"\
        },\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>Bounding box around the body of a celebrity.</p>\"\
        },\
        \"Face\":{\
          \"shape\":\"FaceDetail\",\
          \"documentation\":\"<p>Face details for the recognized celebrity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a recognized celebrity.</p>\"\
    },\
    \"CelebrityList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Celebrity\"}\
    },\
    \"CelebrityRecognition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time, in milliseconds from the start of the video, that the celebrity was recognized.</p>\"\
        },\
        \"Celebrity\":{\
          \"shape\":\"CelebrityDetail\",\
          \"documentation\":\"<p>Information about a recognized celebrity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a detected celebrity and the time the celebrity was detected in a stored video. For more information, see .</p>\"\
    },\
    \"CelebrityRecognitionSortBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ID\",\
        \"TIMESTAMP\"\
      ]\
    },\
    \"CelebrityRecognitions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CelebrityRecognition\"}\
    },\
    \"ClientRequestToken\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9-_]+$\"\
    },\
    \"CollectionId\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.\\\\-]+\"\
    },\
    \"CollectionIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CollectionId\"}\
    },\
    \"CompareFacesMatch\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Similarity\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence that the faces match.</p>\"\
        },\
        \"Face\":{\
          \"shape\":\"ComparedFace\",\
          \"documentation\":\"<p>Provides face metadata (bounding box and confidence that the bounding box actually contains a face).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a face in a target image that matches the source image face analysed by <code>CompareFaces</code>. The <code>Face</code> property contains the bounding box of the face in the target image. The <code>Similarity</code> property is the confidence that the source image face matches the face in the bounding box.</p>\"\
    },\
    \"CompareFacesMatchList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CompareFacesMatch\"}\
    },\
    \"CompareFacesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SourceImage\",\
        \"TargetImage\"\
      ],\
      \"members\":{\
        \"SourceImage\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported. </p>\"\
        },\
        \"TargetImage\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The target image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported. </p>\"\
        },\
        \"SimilarityThreshold\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The minimum level of confidence in the face matches that a match must meet to be included in the <code>FaceMatches</code> array.</p>\"\
        }\
      }\
    },\
    \"CompareFacesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SourceImageFace\":{\
          \"shape\":\"ComparedSourceImageFace\",\
          \"documentation\":\"<p>The face in the source image that was used for comparison.</p>\"\
        },\
        \"FaceMatches\":{\
          \"shape\":\"CompareFacesMatchList\",\
          \"documentation\":\"<p>An array of faces in the target image that match the source image face. Each <code>CompareFacesMatch</code> object provides the bounding box, the confidence level that the bounding box contains a face, and the similarity score for the face in the bounding box and the face in the source image.</p>\"\
        },\
        \"UnmatchedFaces\":{\
          \"shape\":\"CompareFacesUnmatchList\",\
          \"documentation\":\"<p>An array of faces in the target image that did not match the source image face.</p>\"\
        },\
        \"SourceImageOrientationCorrection\":{\
          \"shape\":\"OrientationCorrection\",\
          \"documentation\":\"<p> The orientation of the source image (counterclockwise direction). If your application displays the source image, you can use this value to correct image orientation. The bounding box coordinates returned in <code>SourceImageFace</code> represent the location of the face before the image orientation is corrected. </p> <note> <p>If the source image is in .jpeg format, it might contain exchangeable image (Exif) metadata that includes the image's orientation. If the Exif metadata for the source image populates the orientation field, the value of <code>OrientationCorrection</code> is null and the <code>SourceImageFace</code> bounding box coordinates represent the location of the face after Exif metadata is used to correct the orientation. Images in .png format don't contain Exif metadata.</p> </note>\"\
        },\
        \"TargetImageOrientationCorrection\":{\
          \"shape\":\"OrientationCorrection\",\
          \"documentation\":\"<p> The orientation of the target image (in counterclockwise direction). If your application displays the target image, you can use this value to correct the orientation of the image. The bounding box coordinates returned in <code>FaceMatches</code> and <code>UnmatchedFaces</code> represent face locations before the image orientation is corrected. </p> <note> <p>If the target image is in .jpg format, it might contain Exif metadata that includes the orientation of the image. If the Exif metadata for the target image populates the orientation field, the value of <code>OrientationCorrection</code> is null and the bounding box coordinates in <code>FaceMatches</code> and <code>UnmatchedFaces</code> represent the location of the face after Exif metadata is used to correct the orientation. Images in .png format don't contain Exif metadata.</p> </note>\"\
        }\
      }\
    },\
    \"CompareFacesUnmatchList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ComparedFace\"}\
    },\
    \"ComparedFace\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>Bounding box of the face.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence that what the bounding box contains is a face.</p>\"\
        },\
        \"Landmarks\":{\
          \"shape\":\"Landmarks\",\
          \"documentation\":\"<p>An array of facial landmarks.</p>\"\
        },\
        \"Pose\":{\
          \"shape\":\"Pose\",\
          \"documentation\":\"<p>Indicates the pose of the face as determined by its pitch, roll, and yaw.</p>\"\
        },\
        \"Quality\":{\
          \"shape\":\"ImageQuality\",\
          \"documentation\":\"<p>Identifies face image brightness and sharpness. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides face metadata for target image faces that are analysed by <code>CompareFaces</code> and <code>RecognizeCelebrities</code>.</p>\"\
    },\
    \"ComparedFaceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ComparedFace\"}\
    },\
    \"ComparedSourceImageFace\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>Bounding box of the face.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Confidence level that the selected bounding box contains a face.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Type that describes the face Amazon Rekognition chose to compare with the faces in the target. This contains a bounding box for the selected face and confidence level that the bounding box contains a face. Note that Amazon Rekognition selects the largest face in the source image for this comparison. </p>\"\
    },\
    \"ContentModerationDetection\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Time, in milliseconds from the beginning of the video, that the moderation label was detected.</p>\"\
        },\
        \"ModerationLabel\":{\
          \"shape\":\"ModerationLabel\",\
          \"documentation\":\"<p>The moderation label detected by in the stored video.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a moderation label detection in a stored video.</p>\"\
    },\
    \"ContentModerationDetections\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ContentModerationDetection\"}\
    },\
    \"ContentModerationSortBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NAME\",\
        \"TIMESTAMP\"\
      ]\
    },\
    \"CreateCollectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CollectionId\"],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>ID for the collection that you are creating.</p>\"\
        }\
      }\
    },\
    \"CreateCollectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StatusCode\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>HTTP status code indicating the result of the operation.</p>\"\
        },\
        \"CollectionArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Amazon Resource Name (ARN) of the collection. You can use this to manage permissions on your resources. </p>\"\
        },\
        \"FaceModelVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Version number of the face detection model associated with the collection you are creating.</p>\"\
        }\
      }\
    },\
    \"CreateStreamProcessorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Input\",\
        \"Output\",\
        \"Name\",\
        \"Settings\",\
        \"RoleArn\"\
      ],\
      \"members\":{\
        \"Input\":{\
          \"shape\":\"StreamProcessorInput\",\
          \"documentation\":\"<p>Kinesis video stream stream that provides the source streaming video. If you are using the AWS CLI, the parameter name is <code>StreamProcessorInput</code>.</p>\"\
        },\
        \"Output\":{\
          \"shape\":\"StreamProcessorOutput\",\
          \"documentation\":\"<p>Kinesis data stream stream to which Rekognition Video puts the analysis results. If you are using the AWS CLI, the parameter name is <code>StreamProcessorOutput</code>.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"StreamProcessorName\",\
          \"documentation\":\"<p>An identifier you assign to the stream processor. You can use <code>Name</code> to manage the stream processor. For example, you can get the current status of the stream processor by calling . <code>Name</code> is idempotent. </p>\"\
        },\
        \"Settings\":{\
          \"shape\":\"StreamProcessorSettings\",\
          \"documentation\":\"<p>Face recognition input parameters to be used by the stream processor. Includes the collection to use for face recognition and the face attributes to detect.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>ARN of the IAM role that allows access to the stream processor.</p>\"\
        }\
      }\
    },\
    \"CreateStreamProcessorResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StreamProcessorArn\":{\
          \"shape\":\"StreamProcessorArn\",\
          \"documentation\":\"<p>ARN for the newly create stream processor.</p>\"\
        }\
      }\
    },\
    \"DateTime\":{\"type\":\"timestamp\"},\
    \"Degree\":{\
      \"type\":\"float\",\
      \"max\":180,\
      \"min\":-180\
    },\
    \"DeleteCollectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CollectionId\"],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>ID of the collection to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteCollectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StatusCode\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>HTTP status code that indicates the result of the operation.</p>\"\
        }\
      }\
    },\
    \"DeleteFacesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionId\",\
        \"FaceIds\"\
      ],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>Collection from which to remove the specific faces.</p>\"\
        },\
        \"FaceIds\":{\
          \"shape\":\"FaceIdList\",\
          \"documentation\":\"<p>An array of face IDs to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteFacesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DeletedFaces\":{\
          \"shape\":\"FaceIdList\",\
          \"documentation\":\"<p>An array of strings (face IDs) of the faces that were deleted.</p>\"\
        }\
      }\
    },\
    \"DeleteStreamProcessorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"StreamProcessorName\",\
          \"documentation\":\"<p>The name of the stream processor you want to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteStreamProcessorResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DescribeStreamProcessorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"StreamProcessorName\",\
          \"documentation\":\"<p>Name of the stream processor for which you want information.</p>\"\
        }\
      }\
    },\
    \"DescribeStreamProcessorResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"StreamProcessorName\",\
          \"documentation\":\"<p>Name of the stream processor. </p>\"\
        },\
        \"StreamProcessorArn\":{\
          \"shape\":\"StreamProcessorArn\",\
          \"documentation\":\"<p>ARN of the stream processor.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StreamProcessorStatus\",\
          \"documentation\":\"<p>Current status of the stream processor.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Detailed status message about the stream processor.</p>\"\
        },\
        \"CreationTimestamp\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>Date and time the stream processor was created</p>\"\
        },\
        \"LastUpdateTimestamp\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time, in Unix format, the stream processor was last updated. For example, when the stream processor moves from a running state to a failed state, or when the user starts or stops the stream processor.</p>\"\
        },\
        \"Input\":{\
          \"shape\":\"StreamProcessorInput\",\
          \"documentation\":\"<p>Kinesis video stream that provides the source streaming video.</p>\"\
        },\
        \"Output\":{\
          \"shape\":\"StreamProcessorOutput\",\
          \"documentation\":\"<p>Kinesis data stream to which Rekognition Video puts the analysis results.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>ARN of the IAM role that allows access to the stream processor.</p>\"\
        },\
        \"Settings\":{\
          \"shape\":\"StreamProcessorSettings\",\
          \"documentation\":\"<p>Face recognition input parameters that are being used by the stream processor. Includes the collection to use for face recognition and the face attributes to detect.</p>\"\
        }\
      }\
    },\
    \"DetectFacesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Image\"],\
      \"members\":{\
        \"Image\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported. </p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>An array of facial attributes you want to be returned. This can be the default list of attributes or all attributes. If you don't specify a value for <code>Attributes</code> or if you specify <code>[\\\"DEFAULT\\\"]</code>, the API returns the following subset of facial attributes: <code>BoundingBox</code>, <code>Confidence</code>, <code>Pose</code>, <code>Quality</code> and <code>Landmarks</code>. If you provide <code>[\\\"ALL\\\"]</code>, all facial attributes are returned but the operation will take longer to complete.</p> <p>If you provide both, <code>[\\\"ALL\\\", \\\"DEFAULT\\\"]</code>, the service uses a logical AND operator to determine which attributes to return (in this case, all attributes). </p>\"\
        }\
      }\
    },\
    \"DetectFacesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FaceDetails\":{\
          \"shape\":\"FaceDetailList\",\
          \"documentation\":\"<p>Details of each face found in the image. </p>\"\
        },\
        \"OrientationCorrection\":{\
          \"shape\":\"OrientationCorrection\",\
          \"documentation\":\"<p> The orientation of the input image (counter-clockwise direction). If your application displays the image, you can use this value to correct image orientation. The bounding box coordinates returned in <code>FaceDetails</code> represent face locations before the image orientation is corrected. </p> <note> <p>If the input image is in .jpeg format, it might contain exchangeable image (Exif) metadata that includes the image's orientation. If so, and the Exif metadata for the input image populates the orientation field, the value of <code>OrientationCorrection</code> is null and the <code>FaceDetails</code> bounding box coordinates represent face locations after Exif metadata is used to correct the image orientation. Images in .png format don't contain Exif metadata.</p> </note>\"\
        }\
      }\
    },\
    \"DetectLabelsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Image\"],\
      \"members\":{\
        \"Image\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported. </p>\"\
        },\
        \"MaxLabels\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>Maximum number of labels you want the service to return in the response. The service returns the specified number of highest confidence labels. </p>\"\
        },\
        \"MinConfidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Specifies the minimum confidence level for the labels to return. Amazon Rekognition doesn't return any labels with confidence lower than this specified value.</p> <p>If <code>MinConfidence</code> is not specified, the operation returns labels with a confidence values greater than or equal to 50 percent.</p>\"\
        }\
      }\
    },\
    \"DetectLabelsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Labels\":{\
          \"shape\":\"Labels\",\
          \"documentation\":\"<p>An array of labels for the real-world objects detected. </p>\"\
        },\
        \"OrientationCorrection\":{\
          \"shape\":\"OrientationCorrection\",\
          \"documentation\":\"<p> The orientation of the input image (counter-clockwise direction). If your application displays the image, you can use this value to correct the orientation. If Amazon Rekognition detects that the input image was rotated (for example, by 90 degrees), it first corrects the orientation before detecting the labels. </p> <note> <p>If the input image Exif metadata populates the orientation field, Amazon Rekognition does not perform orientation correction and the value of OrientationCorrection will be null.</p> </note>\"\
        }\
      }\
    },\
    \"DetectModerationLabelsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Image\"],\
      \"members\":{\
        \"Image\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported. </p>\"\
        },\
        \"MinConfidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Specifies the minimum confidence level for the labels to return. Amazon Rekognition doesn't return any labels with a confidence level lower than this specified value.</p> <p>If you don't specify <code>MinConfidence</code>, the operation returns labels with confidence values greater than or equal to 50 percent.</p>\"\
        }\
      }\
    },\
    \"DetectModerationLabelsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ModerationLabels\":{\
          \"shape\":\"ModerationLabels\",\
          \"documentation\":\"<p>Array of detected Moderation labels and the time, in millseconds from the start of the video, they were detected.</p>\"\
        }\
      }\
    },\
    \"DetectTextRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Image\"],\
      \"members\":{\
        \"Image\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The input image as base64-encoded bytes or an Amazon S3 object. If you use the AWS CLI to call Amazon Rekognition operations, you can't pass image bytes. </p>\"\
        }\
      }\
    },\
    \"DetectTextResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TextDetections\":{\
          \"shape\":\"TextDetectionList\",\
          \"documentation\":\"<p>An array of text that was detected in the input image.</p>\"\
        }\
      }\
    },\
    \"Emotion\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"EmotionName\",\
          \"documentation\":\"<p>Type of emotion detected.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The emotions detected on the face, and the confidence level in the determination. For example, HAPPY, SAD, and ANGRY.</p>\"\
    },\
    \"EmotionName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"HAPPY\",\
        \"SAD\",\
        \"ANGRY\",\
        \"CONFUSED\",\
        \"DISGUSTED\",\
        \"SURPRISED\",\
        \"CALM\",\
        \"UNKNOWN\"\
      ]\
    },\
    \"Emotions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Emotion\"}\
    },\
    \"ExternalImageId\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.\\\\-:]+\"\
    },\
    \"EyeOpen\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the eyes on the face are open.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the eyes on the face are open, and the confidence level in the determination.</p>\"\
    },\
    \"Eyeglasses\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the face is wearing eye glasses or not.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the face is wearing eye glasses, and the confidence level in the determination.</p>\"\
    },\
    \"Face\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FaceId\":{\
          \"shape\":\"FaceId\",\
          \"documentation\":\"<p>Unique identifier that Amazon Rekognition assigns to the face.</p>\"\
        },\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>Bounding box of the face.</p>\"\
        },\
        \"ImageId\":{\
          \"shape\":\"ImageId\",\
          \"documentation\":\"<p>Unique identifier that Amazon Rekognition assigns to the input image.</p>\"\
        },\
        \"ExternalImageId\":{\
          \"shape\":\"ExternalImageId\",\
          \"documentation\":\"<p>Identifier that you assign to all the faces in the input image.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Confidence level that the bounding box contains a face (and not a different object such as a tree).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the face properties such as the bounding box, face ID, image ID of the input image, and external image ID that you assigned. </p>\"\
    },\
    \"FaceAttributes\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DEFAULT\",\
        \"ALL\"\
      ]\
    },\
    \"FaceDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>Bounding box of the face.</p>\"\
        },\
        \"AgeRange\":{\
          \"shape\":\"AgeRange\",\
          \"documentation\":\"<p>The estimated age range, in years, for the face. Low represents the lowest estimated age and High represents the highest estimated age.</p>\"\
        },\
        \"Smile\":{\
          \"shape\":\"Smile\",\
          \"documentation\":\"<p>Indicates whether or not the face is smiling, and the confidence level in the determination.</p>\"\
        },\
        \"Eyeglasses\":{\
          \"shape\":\"Eyeglasses\",\
          \"documentation\":\"<p>Indicates whether or not the face is wearing eye glasses, and the confidence level in the determination.</p>\"\
        },\
        \"Sunglasses\":{\
          \"shape\":\"Sunglasses\",\
          \"documentation\":\"<p>Indicates whether or not the face is wearing sunglasses, and the confidence level in the determination.</p>\"\
        },\
        \"Gender\":{\
          \"shape\":\"Gender\",\
          \"documentation\":\"<p>Gender of the face and the confidence level in the determination.</p>\"\
        },\
        \"Beard\":{\
          \"shape\":\"Beard\",\
          \"documentation\":\"<p>Indicates whether or not the face has a beard, and the confidence level in the determination.</p>\"\
        },\
        \"Mustache\":{\
          \"shape\":\"Mustache\",\
          \"documentation\":\"<p>Indicates whether or not the face has a mustache, and the confidence level in the determination.</p>\"\
        },\
        \"EyesOpen\":{\
          \"shape\":\"EyeOpen\",\
          \"documentation\":\"<p>Indicates whether or not the eyes on the face are open, and the confidence level in the determination.</p>\"\
        },\
        \"MouthOpen\":{\
          \"shape\":\"MouthOpen\",\
          \"documentation\":\"<p>Indicates whether or not the mouth on the face is open, and the confidence level in the determination.</p>\"\
        },\
        \"Emotions\":{\
          \"shape\":\"Emotions\",\
          \"documentation\":\"<p>The emotions detected on the face, and the confidence level in the determination. For example, HAPPY, SAD, and ANGRY. </p>\"\
        },\
        \"Landmarks\":{\
          \"shape\":\"Landmarks\",\
          \"documentation\":\"<p>Indicates the location of landmarks on the face.</p>\"\
        },\
        \"Pose\":{\
          \"shape\":\"Pose\",\
          \"documentation\":\"<p>Indicates the pose of the face as determined by its pitch, roll, and yaw.</p>\"\
        },\
        \"Quality\":{\
          \"shape\":\"ImageQuality\",\
          \"documentation\":\"<p>Identifies image brightness and sharpness.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Confidence level that the bounding box contains a face (and not a different object such as a tree).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Structure containing attributes of the face that the algorithm detected.</p>\"\
    },\
    \"FaceDetailList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FaceDetail\"}\
    },\
    \"FaceDetection\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Time, in milliseconds from the start of the video, that the face was detected.</p>\"\
        },\
        \"Face\":{\
          \"shape\":\"FaceDetail\",\
          \"documentation\":\"<p>The face properties for the detected face.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a face detected in a video analysis request and the time the face was detected in the video. </p>\"\
    },\
    \"FaceDetections\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FaceDetection\"}\
    },\
    \"FaceId\":{\
      \"type\":\"string\",\
      \"pattern\":\"[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\"\
    },\
    \"FaceIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FaceId\"},\
      \"max\":4096,\
      \"min\":1\
    },\
    \"FaceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Face\"}\
    },\
    \"FaceMatch\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Similarity\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Confidence in the match of this face with the input face.</p>\"\
        },\
        \"Face\":{\
          \"shape\":\"Face\",\
          \"documentation\":\"<p>Describes the face properties such as the bounding box, face ID, image ID of the source image, and external image ID that you assigned.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides face metadata. In addition, it also provides the confidence in the match of this face with the input face.</p>\"\
    },\
    \"FaceMatchList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FaceMatch\"}\
    },\
    \"FaceModelVersionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"FaceRecord\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Face\":{\
          \"shape\":\"Face\",\
          \"documentation\":\"<p>Describes the face properties such as the bounding box, face ID, image ID of the input image, and external image ID that you assigned. </p>\"\
        },\
        \"FaceDetail\":{\
          \"shape\":\"FaceDetail\",\
          \"documentation\":\"<p>Structure containing attributes of the face that the algorithm detected.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Object containing both the face metadata (stored in the back-end database) and facial attributes that are detected but aren't stored in the database.</p>\"\
    },\
    \"FaceRecordList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FaceRecord\"}\
    },\
    \"FaceSearchSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>The ID of a collection that contains faces that you want to search for.</p>\"\
        },\
        \"FaceMatchThreshold\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Minimum face match confidence score that must be met to return a result for a recognized face. Default is 70. 0 is the lowest confidence. 100 is the highest confidence.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input face recognition parameters for an Amazon Rekognition stream processor. <code>FaceRecognitionSettings</code> is a request parameter for .</p>\"\
    },\
    \"FaceSearchSortBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INDEX\",\
        \"TIMESTAMP\"\
      ]\
    },\
    \"Float\":{\"type\":\"float\"},\
    \"Gender\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"GenderType\",\
          \"documentation\":\"<p>Gender of the face.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Gender of the face and the confidence level in the determination.</p>\"\
    },\
    \"GenderType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Male\",\
        \"Female\"\
      ]\
    },\
    \"Geometry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>An axis-aligned coarse representation of the detected text's location on the image.</p>\"\
        },\
        \"Polygon\":{\
          \"shape\":\"Polygon\",\
          \"documentation\":\"<p>Within the bounding box, a fine-grained polygon around the detected text.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about where text detected by is located on an image.</p>\"\
    },\
    \"GetCelebrityInfoRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"RekognitionUniqueId\",\
          \"documentation\":\"<p>The ID for the celebrity. You get the celebrity ID from a call to the operation, which recognizes celebrities in an image. </p>\"\
        }\
      }\
    },\
    \"GetCelebrityInfoResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Urls\":{\
          \"shape\":\"Urls\",\
          \"documentation\":\"<p>An array of URLs pointing to additional celebrity information. </p>\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the celebrity.</p>\"\
        }\
      }\
    },\
    \"GetCelebrityRecognitionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>Job identifier for the required celebrity recognition analysis. You can get the job identifer from a call to <code>StartCelebrityRecognition</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>Maximum number of celebrities you want Rekognition Video to return in the response. The default is 1000.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there is more recognized celebrities to retrieve), Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of celebrities. </p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"CelebrityRecognitionSortBy\",\
          \"documentation\":\"<p>Sort to use for celebrities returned in <code>Celebrities</code> field. Specify <code>ID</code> to sort by the celebrity identifier, specify <code>TIMESTAMP</code> to sort by the time the celebrity was recognized.</p>\"\
        }\
      }\
    },\
    \"GetCelebrityRecognitionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobStatus\":{\
          \"shape\":\"VideoJobStatus\",\
          \"documentation\":\"<p>The current status of the celebrity recognition job.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>\"\
        },\
        \"VideoMetadata\":{\
          \"shape\":\"VideoMetadata\",\
          \"documentation\":\"<p>Information about a video that Rekognition Video analyzed. <code>Videometadata</code> is returned in every page of paginated responses from a Rekognition Video operation.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the response is truncated, Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of celebrities.</p>\"\
        },\
        \"Celebrities\":{\
          \"shape\":\"CelebrityRecognitions\",\
          \"documentation\":\"<p>Array of celebrities recognized in the video.</p>\"\
        }\
      }\
    },\
    \"GetContentModerationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier for the content moderation job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetContentModeration</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>Maximum number of content moderation labels to return. The default is 1000.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there is more data to retrieve), Amazon Rekognition returns a pagination token in the response. You can use this pagination token to retrieve the next set of content moderation labels.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"ContentModerationSortBy\",\
          \"documentation\":\"<p>Sort to use for elements in the <code>ModerationLabelDetections</code> array. Use <code>TIMESTAMP</code> to sort array elements by the time labels are detected. Use <code>NAME</code> to alphabetically group elements for a label together. Within each label group, the array element are sorted by detection confidence. The default sort is by <code>TIMESTAMP</code>.</p>\"\
        }\
      }\
    },\
    \"GetContentModerationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobStatus\":{\
          \"shape\":\"VideoJobStatus\",\
          \"documentation\":\"<p>The current status of the content moderation job.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>\"\
        },\
        \"VideoMetadata\":{\
          \"shape\":\"VideoMetadata\",\
          \"documentation\":\"<p>Information about a video that Amazon Rekognition analyzed. <code>Videometadata</code> is returned in every page of paginated responses from <code>GetContentModeration</code>. </p>\"\
        },\
        \"ModerationLabels\":{\
          \"shape\":\"ContentModerationDetections\",\
          \"documentation\":\"<p>The detected moderation labels and the time(s) they were detected.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the response is truncated, Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of moderation labels. </p>\"\
        }\
      }\
    },\
    \"GetFaceDetectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>Unique identifier for the face detection job. The <code>JobId</code> is returned from <code>StartFaceDetection</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>Maximum number of detected faces to return. The default is 1000.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there are more faces to retrieve), Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of faces.</p>\"\
        }\
      }\
    },\
    \"GetFaceDetectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobStatus\":{\
          \"shape\":\"VideoJobStatus\",\
          \"documentation\":\"<p>The current status of the face detection job.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>\"\
        },\
        \"VideoMetadata\":{\
          \"shape\":\"VideoMetadata\",\
          \"documentation\":\"<p>Information about a video that Rekognition Video analyzed. <code>Videometadata</code> is returned in every page of paginated responses from a Amazon Rekognition video operation.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon Rekognition returns this token that you can use in the subsequent request to retrieve the next set of faces. </p>\"\
        },\
        \"Faces\":{\
          \"shape\":\"FaceDetections\",\
          \"documentation\":\"<p>An array of faces detected in the video. Each element contains a detected face's details and the time, in milliseconds from the start of the video, the face was detected. </p>\"\
        }\
      }\
    },\
    \"GetFaceSearchRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The job identifer for the search request. You get the job identifier from an initial call to <code>StartFaceSearch</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>Maximum number of search results you want Rekognition Video to return in the response. The default is 1000.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there is more search results to retrieve), Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of search results. </p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"FaceSearchSortBy\",\
          \"documentation\":\"<p>Sort to use for grouping faces in the response. Use <code>TIMESTAMP</code> to group faces by the time that they are recognized. Use <code>INDEX</code> to sort by recognized faces. </p>\"\
        }\
      }\
    },\
    \"GetFaceSearchResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobStatus\":{\
          \"shape\":\"VideoJobStatus\",\
          \"documentation\":\"<p>The current status of the face search job.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the response is truncated, Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of search results. </p>\"\
        },\
        \"VideoMetadata\":{\
          \"shape\":\"VideoMetadata\",\
          \"documentation\":\"<p>Information about a video that Amazon Rekognition analyzed. <code>Videometadata</code> is returned in every page of paginated responses from a Rekognition Video operation. </p>\"\
        },\
        \"Persons\":{\
          \"shape\":\"PersonMatches\",\
          \"documentation\":\"<p>An array of persons, , in the video whose face(s) match the face(s) in an Amazon Rekognition collection. It also includes time information for when persons are matched in the video. You specify the input collection in an initial call to <code>StartFaceSearch</code>. Each <code>Persons</code> element includes a time the person was matched, face match details (<code>FaceMatches</code>) for matching faces in the collection, and person information (<code>Person</code>) for the matched person. </p>\"\
        }\
      }\
    },\
    \"GetLabelDetectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>Job identifier for the label detection operation for which you want results returned. You get the job identifer from an initial call to <code>StartlabelDetection</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>Maximum number of labels you want Amazon Rekognition to return in the response. The default is 1000.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there are more labels to retrieve), Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of labels. </p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"LabelDetectionSortBy\",\
          \"documentation\":\"<p>Sort to use for elements in the <code>Labels</code> array. Use <code>TIMESTAMP</code> to sort array elements by the time labels are detected. Use <code>NAME</code> to alphabetically group elements for a label together. Within each label group, the array element are sorted by detection confidence. The default sort is by <code>TIMESTAMP</code>.</p>\"\
        }\
      }\
    },\
    \"GetLabelDetectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobStatus\":{\
          \"shape\":\"VideoJobStatus\",\
          \"documentation\":\"<p>The current status of the label detection job.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>\"\
        },\
        \"VideoMetadata\":{\
          \"shape\":\"VideoMetadata\",\
          \"documentation\":\"<p>Information about a video that Rekognition Video analyzed. <code>Videometadata</code> is returned in every page of paginated responses from a Amazon Rekognition video operation.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the response is truncated, Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of labels.</p>\"\
        },\
        \"Labels\":{\
          \"shape\":\"LabelDetections\",\
          \"documentation\":\"<p>An array of labels detected in the video. Each element contains the detected label and the time, in milliseconds from the start of the video, that the label was detected. </p>\"\
        }\
      }\
    },\
    \"GetPersonTrackingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier for a job that tracks persons in a video. You get the <code>JobId</code> from a call to <code>StartPersonTracking</code>. </p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>Maximum number of tracked persons to return. The default is 1000. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there are more persons to retrieve), Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of persons. </p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"PersonTrackingSortBy\",\
          \"documentation\":\"<p>Sort to use for elements in the <code>Persons</code> array. Use <code>TIMESTAMP</code> to sort array elements by the time persons are detected. Use <code>INDEX</code> to sort by the tracked persons. If you sort by <code>INDEX</code>, the array elements for each person are sorted by detection confidence. The default sort is by <code>TIMESTAMP</code>.</p>\"\
        }\
      }\
    },\
    \"GetPersonTrackingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobStatus\":{\
          \"shape\":\"VideoJobStatus\",\
          \"documentation\":\"<p>The current status of the person tracking job.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>\"\
        },\
        \"VideoMetadata\":{\
          \"shape\":\"VideoMetadata\",\
          \"documentation\":\"<p>Information about a video that Rekognition Video analyzed. <code>Videometadata</code> is returned in every page of paginated responses from a Rekognition Video operation.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the response is truncated, Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of persons. </p>\"\
        },\
        \"Persons\":{\
          \"shape\":\"PersonDetections\",\
          \"documentation\":\"<p>An array of the persons detected in the video and the times they are tracked throughout the video. An array element will exist for each time the person is tracked. </p>\"\
        }\
      }\
    },\
    \"IdempotentParameterMismatchException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A <code>ClientRequestToken</code> input parameter was reused with an operation, but at least one of the other input parameters is different from the previous call to the operation.</p>\",\
      \"exception\":true\
    },\
    \"Image\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Bytes\":{\
          \"shape\":\"ImageBlob\",\
          \"documentation\":\"<p>Blob of image bytes up to 5 MBs.</p>\"\
        },\
        \"S3Object\":{\
          \"shape\":\"S3Object\",\
          \"documentation\":\"<p>Identifies an S3 object as the image source.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides the input image either as bytes or an S3 object.</p> <p>You pass image bytes to a Rekognition API operation by using the <code>Bytes</code> property. For example, you would use the <code>Bytes</code> property to pass an image loaded from a local file system. Image bytes passed by using the <code>Bytes</code> property must be base64-encoded. Your code may not need to encode image bytes if you are using an AWS SDK to call Rekognition API operations. For more information, see <a>images-bytes</a>.</p> <p> You pass images stored in an S3 bucket to a Rekognition API operation by using the <code>S3Object</code> property. Images stored in an S3 bucket do not need to be base64-encoded.</p> <p>The region for the S3 bucket containing the S3 object must match the region you use for Amazon Rekognition operations.</p> <p>If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes using the Bytes property is not supported. You must first upload the image to an Amazon S3 bucket and then call the operation using the S3Object property.</p> <p>For Amazon Rekognition to process an S3 object, the user must have permission to access the S3 object. For more information, see <a>manage-access-resource-policies</a>. </p>\"\
    },\
    \"ImageBlob\":{\
      \"type\":\"blob\",\
      \"max\":5242880,\
      \"min\":1\
    },\
    \"ImageId\":{\
      \"type\":\"string\",\
      \"pattern\":\"[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\"\
    },\
    \"ImageQuality\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Brightness\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Value representing brightness of the face. The service returns a value between 0 and 100 (inclusive). A higher value indicates a brighter face image.</p>\"\
        },\
        \"Sharpness\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Value representing sharpness of the face. The service returns a value between 0 and 100 (inclusive). A higher value indicates a sharper face image.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifies face image brightness and sharpness. </p>\"\
    },\
    \"ImageTooLargeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The input image size exceeds the allowed limit. For more information, see <a>limits</a>. </p>\",\
      \"exception\":true\
    },\
    \"IndexFacesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionId\",\
        \"Image\"\
      ],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>The ID of an existing collection to which you want to add the faces that are detected in the input images.</p>\"\
        },\
        \"Image\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported. </p>\"\
        },\
        \"ExternalImageId\":{\
          \"shape\":\"ExternalImageId\",\
          \"documentation\":\"<p>ID you want to assign to all the faces detected in the image.</p>\"\
        },\
        \"DetectionAttributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>An array of facial attributes that you want to be returned. This can be the default list of attributes or all attributes. If you don't specify a value for <code>Attributes</code> or if you specify <code>[\\\"DEFAULT\\\"]</code>, the API returns the following subset of facial attributes: <code>BoundingBox</code>, <code>Confidence</code>, <code>Pose</code>, <code>Quality</code> and <code>Landmarks</code>. If you provide <code>[\\\"ALL\\\"]</code>, all facial attributes are returned but the operation will take longer to complete.</p> <p>If you provide both, <code>[\\\"ALL\\\", \\\"DEFAULT\\\"]</code>, the service uses a logical AND operator to determine which attributes to return (in this case, all attributes). </p>\"\
        }\
      }\
    },\
    \"IndexFacesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FaceRecords\":{\
          \"shape\":\"FaceRecordList\",\
          \"documentation\":\"<p>An array of faces detected and added to the collection. For more information, see <a>collections-index-faces</a>. </p>\"\
        },\
        \"OrientationCorrection\":{\
          \"shape\":\"OrientationCorrection\",\
          \"documentation\":\"<p>The orientation of the input image (counterclockwise direction). If your application displays the image, you can use this value to correct image orientation. The bounding box coordinates returned in <code>FaceRecords</code> represent face locations before the image orientation is corrected. </p> <note> <p>If the input image is in jpeg format, it might contain exchangeable image (Exif) metadata. If so, and the Exif metadata populates the orientation field, the value of <code>OrientationCorrection</code> is null and the bounding box coordinates in <code>FaceRecords</code> represent face locations after Exif metadata is used to correct the image orientation. Images in .png format don't contain Exif metadata.</p> </note>\"\
        },\
        \"FaceModelVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Version number of the face detection model associated with the input collection (<code>CollectionId</code>).</p>\"\
        }\
      }\
    },\
    \"InternalServerError\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Amazon Rekognition experienced a service issue. Try your call again.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidImageFormatException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The provided image format is not supported. </p>\",\
      \"exception\":true\
    },\
    \"InvalidPaginationTokenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Pagination token in the request is not valid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidParameterException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Input parameter violated a constraint. Validate your parameter before calling the API operation again.</p>\",\
      \"exception\":true\
    },\
    \"InvalidS3ObjectException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Amazon Rekognition is unable to access the S3 object specified in the request.</p>\",\
      \"exception\":true\
    },\
    \"JobId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9-_]+$\"\
    },\
    \"JobTag\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.\\\\-:]+\"\
    },\
    \"KinesisDataArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"(^arn:([a-z\\\\d-]+):kinesis:([a-z\\\\d-]+):\\\\d{12}:.+$)\"\
    },\
    \"KinesisDataStream\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"KinesisDataArn\",\
          \"documentation\":\"<p>ARN of the output Amazon Kinesis Data Streams stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Kinesis data stream Amazon Rekognition to which the analysis results of a Amazon Rekognition stream processor are streamed. For more information, see .</p>\"\
    },\
    \"KinesisVideoArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"(^arn:([a-z\\\\d-]+):kinesisvideo:([a-z\\\\d-]+):\\\\d{12}:.+$)\"\
    },\
    \"KinesisVideoStream\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"KinesisVideoArn\",\
          \"documentation\":\"<p>ARN of the Kinesis video stream stream that streams the source video.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Kinesis video stream stream that provides the source streaming video for a Rekognition Video stream processor. For more information, see .</p>\"\
    },\
    \"Label\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name (label) of the object.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Structure containing details about the detected label, including name, and level of confidence.</p>\"\
    },\
    \"LabelDetection\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Time, in milliseconds from the start of the video, that the label was detected.</p>\"\
        },\
        \"Label\":{\
          \"shape\":\"Label\",\
          \"documentation\":\"<p>Details about the detected label.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a label detected in a video analysis request and the time the label was detected in the video. </p>\"\
    },\
    \"LabelDetectionSortBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NAME\",\
        \"TIMESTAMP\"\
      ]\
    },\
    \"LabelDetections\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LabelDetection\"}\
    },\
    \"Labels\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Label\"}\
    },\
    \"Landmark\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"LandmarkType\",\
          \"documentation\":\"<p>Type of the landmark.</p>\"\
        },\
        \"X\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>x-coordinate from the top left of the landmark expressed as the ratio of the width of the image. For example, if the images is 700x200 and the x-coordinate of the landmark is at 350 pixels, this value is 0.5. </p>\"\
        },\
        \"Y\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>y-coordinate from the top left of the landmark expressed as the ratio of the height of the image. For example, if the images is 700x200 and the y-coordinate of the landmark is at 100 pixels, this value is 0.5.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates the location of the landmark on the face.</p>\"\
    },\
    \"LandmarkType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"eyeLeft\",\
        \"eyeRight\",\
        \"nose\",\
        \"mouthLeft\",\
        \"mouthRight\",\
        \"leftEyeBrowLeft\",\
        \"leftEyeBrowRight\",\
        \"leftEyeBrowUp\",\
        \"rightEyeBrowLeft\",\
        \"rightEyeBrowRight\",\
        \"rightEyeBrowUp\",\
        \"leftEyeLeft\",\
        \"leftEyeRight\",\
        \"leftEyeUp\",\
        \"leftEyeDown\",\
        \"rightEyeLeft\",\
        \"rightEyeRight\",\
        \"rightEyeUp\",\
        \"rightEyeDown\",\
        \"noseLeft\",\
        \"noseRight\",\
        \"mouthUp\",\
        \"mouthDown\",\
        \"leftPupil\",\
        \"rightPupil\"\
      ]\
    },\
    \"Landmarks\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Landmark\"}\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p/>\",\
      \"exception\":true\
    },\
    \"ListCollectionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>Pagination token from the previous response.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>Maximum number of collection IDs to return. </p>\"\
        }\
      }\
    },\
    \"ListCollectionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CollectionIds\":{\
          \"shape\":\"CollectionIdList\",\
          \"documentation\":\"<p>An array of collection IDs.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the result is truncated, the response provides a <code>NextToken</code> that you can use in the subsequent request to fetch the next set of collection IDs.</p>\"\
        },\
        \"FaceModelVersions\":{\
          \"shape\":\"FaceModelVersionList\",\
          \"documentation\":\"<p>Version numbers of the face detection models associated with the collections in the array <code>CollectionIds</code>. For example, the value of <code>FaceModelVersions[2]</code> is the version number for the face detection model used by the collection in <code>CollectionId[2]</code>.</p>\"\
        }\
      }\
    },\
    \"ListFacesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CollectionId\"],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>ID of the collection from which to list the faces.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there is more data to retrieve), Amazon Rekognition returns a pagination token in the response. You can use this pagination token to retrieve the next set of faces.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>Maximum number of faces to return.</p>\"\
        }\
      }\
    },\
    \"ListFacesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Faces\":{\
          \"shape\":\"FaceList\",\
          \"documentation\":\"<p>An array of <code>Face</code> objects. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>If the response is truncated, Amazon Rekognition returns this token that you can use in the subsequent request to retrieve the next set of faces.</p>\"\
        },\
        \"FaceModelVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Version number of the face detection model associated with the input collection (<code>CollectionId</code>).</p>\"\
        }\
      }\
    },\
    \"ListStreamProcessorsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there are more stream processors to retrieve), Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of stream processors. </p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>Maximum number of stream processors you want Rekognition Video to return in the response. The default is 1000. </p>\"\
        }\
      }\
    },\
    \"ListStreamProcessorsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the response is truncated, Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of stream processors. </p>\"\
        },\
        \"StreamProcessors\":{\
          \"shape\":\"StreamProcessorList\",\
          \"documentation\":\"<p>List of stream processors that you have created.</p>\"\
        }\
      }\
    },\
    \"MaxFaces\":{\
      \"type\":\"integer\",\
      \"max\":4096,\
      \"min\":1\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"ModerationLabel\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Specifies the confidence that Amazon Rekognition has that the label has been correctly identified.</p> <p>If you don't specify the <code>MinConfidence</code> parameter in the call to <code>DetectModerationLabels</code>, the operation returns labels with a confidence value greater than or equal to 50 percent.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The label name for the type of content detected in the image.</p>\"\
        },\
        \"ParentName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name for the parent label. Labels at the top-level of the hierarchy have the parent label <code>\\\"\\\"</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a single type of moderated content found in an image or video. Each type of moderated content has a label within a hierarchical taxonomy. For more information, see <a>moderation</a>.</p>\"\
    },\
    \"ModerationLabels\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ModerationLabel\"}\
    },\
    \"MouthOpen\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the mouth on the face is open or not.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the mouth on the face is open, and the confidence level in the determination.</p>\"\
    },\
    \"Mustache\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the face has mustache or not.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the face has a mustache, and the confidence level in the determination.</p>\"\
    },\
    \"NotificationChannel\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SNSTopicArn\",\
        \"RoleArn\"\
      ],\
      \"members\":{\
        \"SNSTopicArn\":{\
          \"shape\":\"SNSTopicArn\",\
          \"documentation\":\"<p>The Amazon SNS topic to which Amazon Rekognition to posts the completion status.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of an IAM role that gives Amazon Rekognition publishing permissions to the Amazon SNS topic. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The Amazon Simple Notification Service topic to which Amazon Rekognition publishes the completion status of a video analysis operation. For more information, see <a>api-video</a>.</p>\"\
    },\
    \"OrientationCorrection\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ROTATE_0\",\
        \"ROTATE_90\",\
        \"ROTATE_180\",\
        \"ROTATE_270\"\
      ]\
    },\
    \"PageSize\":{\
      \"type\":\"integer\",\
      \"max\":4096,\
      \"min\":0\
    },\
    \"PaginationToken\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"Percent\":{\
      \"type\":\"float\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"PersonDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"PersonIndex\",\
          \"documentation\":\"<p>Identifier for the person detected person within a video. Use to keep track of the person throughout the video. The identifier is not stored by Amazon Rekognition.</p>\"\
        },\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>Bounding box around the detected person.</p>\"\
        },\
        \"Face\":{\
          \"shape\":\"FaceDetail\",\
          \"documentation\":\"<p>Face details for the detected person.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about a person detected in a video analysis request.</p>\"\
    },\
    \"PersonDetection\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time, in milliseconds from the start of the video, that the person was tracked.</p>\"\
        },\
        \"Person\":{\
          \"shape\":\"PersonDetail\",\
          \"documentation\":\"<p>Details about a person tracked in a video.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details and tracking information for a single time a person is tracked in a video. Amazon Rekognition operations that track persons return an array of <code>PersonDetection</code> objects with elements for each time a person is tracked in a video. For more information, see . </p>\"\
    },\
    \"PersonDetections\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PersonDetection\"}\
    },\
    \"PersonIndex\":{\"type\":\"long\"},\
    \"PersonMatch\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time, in milliseconds from the beginning of the video, that the person was matched in the video.</p>\"\
        },\
        \"Person\":{\
          \"shape\":\"PersonDetail\",\
          \"documentation\":\"<p>Information about the matched person.</p>\"\
        },\
        \"FaceMatches\":{\
          \"shape\":\"FaceMatchList\",\
          \"documentation\":\"<p>Information about the faces in the input collection that match the face of a person in the video.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a person whose face matches a face(s) in a Amazon Rekognition collection. Includes information about the faces in the Amazon Rekognition collection (,information about the person (<a>PersonDetail</a>) and the timestamp for when the person was detected in a video. An array of <code>PersonMatch</code> objects is returned by . </p>\"\
    },\
    \"PersonMatches\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PersonMatch\"}\
    },\
    \"PersonTrackingSortBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INDEX\",\
        \"TIMESTAMP\"\
      ]\
    },\
    \"Point\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"X\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The value of the X coordinate for a point on a <code>Polygon</code>.</p>\"\
        },\
        \"Y\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The value of the Y coordinate for a point on a <code>Polygon</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The X and Y coordinates of a point on an image. The X and Y values returned are ratios of the overall image size. For example, if the input image is 700x200 and the operation returns X=0.5 and Y=0.25, then the point is at the (350,50) pixel coordinate on the image.</p> <p>An array of <code>Point</code> objects, <code>Polygon</code>, is returned by . <code>Polygon</code> represents a fine-grained polygon around detected text. For more information, see . </p>\"\
    },\
    \"Polygon\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Point\"}\
    },\
    \"Pose\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Roll\":{\
          \"shape\":\"Degree\",\
          \"documentation\":\"<p>Value representing the face rotation on the roll axis.</p>\"\
        },\
        \"Yaw\":{\
          \"shape\":\"Degree\",\
          \"documentation\":\"<p>Value representing the face rotation on the yaw axis.</p>\"\
        },\
        \"Pitch\":{\
          \"shape\":\"Degree\",\
          \"documentation\":\"<p>Value representing the face rotation on the pitch axis.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates the pose of the face as determined by its pitch, roll, and yaw.</p>\"\
    },\
    \"ProvisionedThroughputExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The number of requests exceeded your throughput limit. If you want to increase this limit, contact Amazon Rekognition.</p>\",\
      \"exception\":true\
    },\
    \"RecognizeCelebritiesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Image\"],\
      \"members\":{\
        \"Image\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported. </p>\"\
        }\
      }\
    },\
    \"RecognizeCelebritiesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CelebrityFaces\":{\
          \"shape\":\"CelebrityList\",\
          \"documentation\":\"<p>Details about each celebrity found in the image. Amazon Rekognition can detect a maximum of 15 celebrities in an image.</p>\"\
        },\
        \"UnrecognizedFaces\":{\
          \"shape\":\"ComparedFaceList\",\
          \"documentation\":\"<p>Details about each unrecognized face in the image.</p>\"\
        },\
        \"OrientationCorrection\":{\
          \"shape\":\"OrientationCorrection\",\
          \"documentation\":\"<p>The orientation of the input image (counterclockwise direction). If your application displays the image, you can use this value to correct the orientation. The bounding box coordinates returned in <code>CelebrityFaces</code> and <code>UnrecognizedFaces</code> represent face locations before the image orientation is corrected. </p> <note> <p>If the input image is in .jpeg format, it might contain exchangeable image (Exif) metadata that includes the image's orientation. If so, and the Exif metadata for the input image populates the orientation field, the value of <code>OrientationCorrection</code> is null and the <code>CelebrityFaces</code> and <code>UnrecognizedFaces</code> bounding box coordinates represent face locations after Exif metadata is used to correct the image orientation. Images in .png format don't contain Exif metadata. </p> </note>\"\
        }\
      }\
    },\
    \"RekognitionUniqueId\":{\
      \"type\":\"string\",\
      \"pattern\":\"[0-9A-Za-z]*\"\
    },\
    \"ResourceAlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A collection with the specified ID already exists.</p>\",\
      \"exception\":true\
    },\
    \"ResourceInUseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p/>\",\
      \"exception\":true\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The collection specified in the request cannot be found.</p>\",\
      \"exception\":true\
    },\
    \"RoleArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"arn:aws:iam::\\\\d{12}:role/?[a-zA-Z_0-9+=,.@\\\\-_/]+\"\
    },\
    \"S3Bucket\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":3,\
      \"pattern\":\"[0-9A-Za-z\\\\.\\\\-_]*\"\
    },\
    \"S3Object\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"S3Bucket\",\
          \"documentation\":\"<p>Name of the S3 bucket.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"S3ObjectName\",\
          \"documentation\":\"<p>S3 object key name.</p>\"\
        },\
        \"Version\":{\
          \"shape\":\"S3ObjectVersion\",\
          \"documentation\":\"<p>If the bucket is versioning enabled, you can specify the object version. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides the S3 bucket name and object name.</p> <p>The region for the S3 bucket containing the S3 object must match the region you use for Amazon Rekognition operations.</p> <p>For Amazon Rekognition to process an S3 object, the user must have permission to access the S3 object. For more information, see <a>manage-access-resource-policies</a>. </p>\"\
    },\
    \"S3ObjectName\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"S3ObjectVersion\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"SNSTopicArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"(^arn:aws:sns:.*:\\\\w{12}:.+$)\"\
    },\
    \"SearchFacesByImageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionId\",\
        \"Image\"\
      ],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>ID of the collection to search.</p>\"\
        },\
        \"Image\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported. </p>\"\
        },\
        \"MaxFaces\":{\
          \"shape\":\"MaxFaces\",\
          \"documentation\":\"<p>Maximum number of faces to return. The operation returns the maximum number of faces with the highest confidence in the match.</p>\"\
        },\
        \"FaceMatchThreshold\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>(Optional) Specifies the minimum confidence in the face match to return. For example, don't return any matches where confidence in matches is less than 70%.</p>\"\
        }\
      }\
    },\
    \"SearchFacesByImageResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SearchedFaceBoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>The bounding box around the face in the input image that Amazon Rekognition used for the search.</p>\"\
        },\
        \"SearchedFaceConfidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The level of confidence that the <code>searchedFaceBoundingBox</code>, contains a face.</p>\"\
        },\
        \"FaceMatches\":{\
          \"shape\":\"FaceMatchList\",\
          \"documentation\":\"<p>An array of faces that match the input face, along with the confidence in the match.</p>\"\
        },\
        \"FaceModelVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Version number of the face detection model associated with the input collection (<code>CollectionId</code>).</p>\"\
        }\
      }\
    },\
    \"SearchFacesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionId\",\
        \"FaceId\"\
      ],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>ID of the collection the face belongs to.</p>\"\
        },\
        \"FaceId\":{\
          \"shape\":\"FaceId\",\
          \"documentation\":\"<p>ID of a face to find matches for in the collection.</p>\"\
        },\
        \"MaxFaces\":{\
          \"shape\":\"MaxFaces\",\
          \"documentation\":\"<p>Maximum number of faces to return. The operation returns the maximum number of faces with the highest confidence in the match.</p>\"\
        },\
        \"FaceMatchThreshold\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Optional value specifying the minimum confidence in the face match to return. For example, don't return any matches where confidence in matches is less than 70%.</p>\"\
        }\
      }\
    },\
    \"SearchFacesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SearchedFaceId\":{\
          \"shape\":\"FaceId\",\
          \"documentation\":\"<p>ID of the face that was searched for matches in a collection.</p>\"\
        },\
        \"FaceMatches\":{\
          \"shape\":\"FaceMatchList\",\
          \"documentation\":\"<p>An array of faces that matched the input face, along with the confidence in the match.</p>\"\
        },\
        \"FaceModelVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Version number of the face detection model associated with the input collection (<code>CollectionId</code>).</p>\"\
        }\
      }\
    },\
    \"Smile\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the face is smiling or not.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the face is smiling, and the confidence level in the determination.</p>\"\
    },\
    \"StartCelebrityRecognitionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Video\"],\
      \"members\":{\
        \"Video\":{\
          \"shape\":\"Video\",\
          \"documentation\":\"<p>The video in which you want to recognize celebrities. The video must be stored in an Amazon S3 bucket.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartCelebrityRecognition</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidently started more than once. </p>\"\
        },\
        \"NotificationChannel\":{\
          \"shape\":\"NotificationChannel\",\
          \"documentation\":\"<p>The Amazon SNS topic ARN that you want Rekognition Video to publish the completion status of the celebrity recognition analysis to.</p>\"\
        },\
        \"JobTag\":{\
          \"shape\":\"JobTag\",\
          \"documentation\":\"<p>Unique identifier you specify to identify the job in the completion status published to the Amazon Simple Notification Service topic. </p>\"\
        }\
      }\
    },\
    \"StartCelebrityRecognitionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier for the celebrity recognition analysis job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetCelebrityRecognition</code>.</p>\"\
        }\
      }\
    },\
    \"StartContentModerationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Video\"],\
      \"members\":{\
        \"Video\":{\
          \"shape\":\"Video\",\
          \"documentation\":\"<p>The video in which you want to moderate content. The video must be stored in an Amazon S3 bucket.</p>\"\
        },\
        \"MinConfidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Specifies the minimum confidence that Amazon Rekognition must have in order to return a moderated content label. Confidence represents how certain Amazon Rekognition is that the moderated content is correctly identified. 0 is the lowest confidence. 100 is the highest confidence. Amazon Rekognition doesn't return any moderated content labels with a confidence level lower than this specified value.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartContentModeration</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidently started more than once. </p>\"\
        },\
        \"NotificationChannel\":{\
          \"shape\":\"NotificationChannel\",\
          \"documentation\":\"<p>The Amazon SNS topic ARN that you want Rekognition Video to publish the completion status of the content moderation analysis to.</p>\"\
        },\
        \"JobTag\":{\
          \"shape\":\"JobTag\",\
          \"documentation\":\"<p>Unique identifier you specify to identify the job in the completion status published to the Amazon Simple Notification Service topic. </p>\"\
        }\
      }\
    },\
    \"StartContentModerationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier for the content moderation analysis job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetContentModeration</code>.</p>\"\
        }\
      }\
    },\
    \"StartFaceDetectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Video\"],\
      \"members\":{\
        \"Video\":{\
          \"shape\":\"Video\",\
          \"documentation\":\"<p>The video in which you want to detect faces. The video must be stored in an Amazon S3 bucket.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartFaceDetection</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidently started more than once. </p>\"\
        },\
        \"NotificationChannel\":{\
          \"shape\":\"NotificationChannel\",\
          \"documentation\":\"<p>The ARN of the Amazon SNS topic to which you want Rekognition Video to publish the completion status of the face detection operation.</p>\"\
        },\
        \"FaceAttributes\":{\
          \"shape\":\"FaceAttributes\",\
          \"documentation\":\"<p>The face attributes you want returned.</p> <p> <code>DEFAULT</code> - The following subset of facial attributes are returned: BoundingBox, Confidence, Pose, Quality and Landmarks. </p> <p> <code>ALL</code> - All facial attributes are returned.</p>\"\
        },\
        \"JobTag\":{\
          \"shape\":\"JobTag\",\
          \"documentation\":\"<p>Unique identifier you specify to identify the job in the completion status published to the Amazon Simple Notification Service topic. </p>\"\
        }\
      }\
    },\
    \"StartFaceDetectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier for the face detection job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetFaceDetection</code>.</p>\"\
        }\
      }\
    },\
    \"StartFaceSearchRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Video\",\
        \"CollectionId\"\
      ],\
      \"members\":{\
        \"Video\":{\
          \"shape\":\"Video\",\
          \"documentation\":\"<p>The video you want to search. The video must be stored in an Amazon S3 bucket. </p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartFaceSearch</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidently started more than once. </p>\"\
        },\
        \"FaceMatchThreshold\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The minimum confidence in the person match to return. For example, don't return any matches where confidence in matches is less than 70%. </p>\"\
        },\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>ID of the collection that contains the faces you want to search for.</p>\"\
        },\
        \"NotificationChannel\":{\
          \"shape\":\"NotificationChannel\",\
          \"documentation\":\"<p>The ARN of the Amazon SNS topic to which you want Rekognition Video to publish the completion status of the search. </p>\"\
        },\
        \"JobTag\":{\
          \"shape\":\"JobTag\",\
          \"documentation\":\"<p>Unique identifier you specify to identify the job in the completion status published to the Amazon Simple Notification Service topic. </p>\"\
        }\
      }\
    },\
    \"StartFaceSearchResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier for the search job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetFaceSearch</code>. </p>\"\
        }\
      }\
    },\
    \"StartLabelDetectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Video\"],\
      \"members\":{\
        \"Video\":{\
          \"shape\":\"Video\",\
          \"documentation\":\"<p>The video in which you want to detect labels. The video must be stored in an Amazon S3 bucket.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartLabelDetection</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidently started more than once. </p>\"\
        },\
        \"MinConfidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Specifies the minimum confidence that Rekognition Video must have in order to return a detected label. Confidence represents how certain Amazon Rekognition is that a label is correctly identified.0 is the lowest confidence. 100 is the highest confidence. Rekognition Video doesn't return any labels with a confidence level lower than this specified value.</p> <p>If you don't specify <code>MinConfidence</code>, the operation returns labels with confidence values greater than or equal to 50 percent.</p>\"\
        },\
        \"NotificationChannel\":{\
          \"shape\":\"NotificationChannel\",\
          \"documentation\":\"<p>The Amazon SNS topic ARN you want Rekognition Video to publish the completion status of the label detection operation to. </p>\"\
        },\
        \"JobTag\":{\
          \"shape\":\"JobTag\",\
          \"documentation\":\"<p>Unique identifier you specify to identify the job in the completion status published to the Amazon Simple Notification Service topic. </p>\"\
        }\
      }\
    },\
    \"StartLabelDetectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier for the label detection job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetLabelDetection</code>. </p>\"\
        }\
      }\
    },\
    \"StartPersonTrackingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Video\"],\
      \"members\":{\
        \"Video\":{\
          \"shape\":\"Video\",\
          \"documentation\":\"<p>The video in which you want to detect people. The video must be stored in an Amazon S3 bucket.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartPersonTracking</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidently started more than once. </p>\"\
        },\
        \"NotificationChannel\":{\
          \"shape\":\"NotificationChannel\",\
          \"documentation\":\"<p>The Amazon SNS topic ARN you want Rekognition Video to publish the completion status of the people detection operation to.</p>\"\
        },\
        \"JobTag\":{\
          \"shape\":\"JobTag\",\
          \"documentation\":\"<p>Unique identifier you specify to identify the job in the completion status published to the Amazon Simple Notification Service topic. </p>\"\
        }\
      }\
    },\
    \"StartPersonTrackingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier for the person detection job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetPersonTracking</code>.</p>\"\
        }\
      }\
    },\
    \"StartStreamProcessorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"StreamProcessorName\",\
          \"documentation\":\"<p>The name of the stream processor to start processing.</p>\"\
        }\
      }\
    },\
    \"StartStreamProcessorResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"StatusMessage\":{\"type\":\"string\"},\
    \"StopStreamProcessorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"StreamProcessorName\",\
          \"documentation\":\"<p>The name of a stream processor created by .</p>\"\
        }\
      }\
    },\
    \"StopStreamProcessorResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"StreamProcessor\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"StreamProcessorName\",\
          \"documentation\":\"<p>Name of the Amazon Rekognition stream processor. </p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StreamProcessorStatus\",\
          \"documentation\":\"<p>Current status of the Amazon Rekognition stream processor.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that recognizes faces in a streaming video. An Amazon Rekognition stream processor is created by a call to . The request parameters for <code>CreateStreamProcessor</code> describe the Kinesis video stream source for the streaming video, face recognition parameters, and where to stream the analysis resullts. </p>\"\
    },\
    \"StreamProcessorArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"(^arn:[a-z\\\\d-]+:rekognition:[a-z\\\\d-]+:\\\\d{12}:streamprocessor\\\\/.+$)\"\
    },\
    \"StreamProcessorInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KinesisVideoStream\":{\
          \"shape\":\"KinesisVideoStream\",\
          \"documentation\":\"<p>The Kinesis video stream input stream for the source streaming video.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the source streaming video. </p>\"\
    },\
    \"StreamProcessorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StreamProcessor\"}\
    },\
    \"StreamProcessorName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.\\\\-]+\"\
    },\
    \"StreamProcessorOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KinesisDataStream\":{\
          \"shape\":\"KinesisDataStream\",\
          \"documentation\":\"<p>The Amazon Kinesis Data Streams stream to which the Amazon Rekognition stream processor streams the analysis results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the Amazon Kinesis Data Streams stream to which a Rekognition Video stream processor streams the results of a video analysis. For more information, see .</p>\"\
    },\
    \"StreamProcessorSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FaceSearch\":{\
          \"shape\":\"FaceSearchSettings\",\
          \"documentation\":\"<p>Face search settings to use on a streaming video. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Input parameters used to recognize faces in a streaming video analyzed by a Amazon Rekognition stream processor.</p>\"\
    },\
    \"StreamProcessorStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"STOPPED\",\
        \"STARTING\",\
        \"RUNNING\",\
        \"FAILED\",\
        \"STOPPING\"\
      ]\
    },\
    \"String\":{\"type\":\"string\"},\
    \"Sunglasses\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the face is wearing sunglasses or not.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the face is wearing sunglasses, and the confidence level in the determination.</p>\"\
    },\
    \"TextDetection\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DetectedText\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The word or line of text recognized by Amazon Rekognition. </p>\"\
        },\
        \"Type\":{\
          \"shape\":\"TextTypes\",\
          \"documentation\":\"<p>The type of text that was detected.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>The identifier for the detected text. The identifier is only unique for a single call to <code>DetectText</code>. </p>\"\
        },\
        \"ParentId\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>The Parent identifier for the detected text identified by the value of <code>ID</code>. If the type of detected text is <code>LINE</code>, the value of <code>ParentId</code> is <code>Null</code>. </p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The confidence that Amazon Rekognition has in the accuracy of the detected text and the accuracy of the geometry points around the detected text.</p>\"\
        },\
        \"Geometry\":{\
          \"shape\":\"Geometry\",\
          \"documentation\":\"<p>The location of the detected text on the image. Includes an axis aligned coarse bounding box surrounding the text and a finer grain polygon for more accurate spatial information.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a word or line of text detected by .</p> <p>The <code>DetectedText</code> field contains the text that Amazon Rekognition detected in the image. </p> <p>Every word and line has an identifier (<code>Id</code>). Each word belongs to a line and has a parent identifier (<code>ParentId</code>) that identifies the line of text in which the word appears. The word <code>Id</code> is also an index for the word within a line of words. </p> <p>For more information, see <a>text-detection</a>.</p>\"\
    },\
    \"TextDetectionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TextDetection\"}\
    },\
    \"TextTypes\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"LINE\",\
        \"WORD\"\
      ]\
    },\
    \"ThrottlingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Amazon Rekognition is temporarily unable to process the request. Try your call again.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"Timestamp\":{\"type\":\"long\"},\
    \"UInteger\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"ULong\":{\
      \"type\":\"long\",\
      \"min\":0\
    },\
    \"Url\":{\"type\":\"string\"},\
    \"Urls\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Url\"}\
    },\
    \"Video\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"S3Object\":{\
          \"shape\":\"S3Object\",\
          \"documentation\":\"<p>The Amazon S3 bucket name and file name for the video.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Video file stored in an Amazon S3 bucket. Amazon Rekognition video start operations such as use <code>Video</code> to specify a video for analysis. The supported file formats are .mp4, .mov and .avi.</p>\"\
    },\
    \"VideoJobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IN_PROGRESS\",\
        \"SUCCEEDED\",\
        \"FAILED\"\
      ]\
    },\
    \"VideoMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Codec\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Type of compression used in the analyzed video. </p>\"\
        },\
        \"DurationMillis\":{\
          \"shape\":\"ULong\",\
          \"documentation\":\"<p>Length of the video in milliseconds.</p>\"\
        },\
        \"Format\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Format of the analyzed video. Possible values are MP4, MOV and AVI. </p>\"\
        },\
        \"FrameRate\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Number of frames per second in the video.</p>\"\
        },\
        \"FrameHeight\":{\
          \"shape\":\"ULong\",\
          \"documentation\":\"<p>Vertical pixel dimension of the video.</p>\"\
        },\
        \"FrameWidth\":{\
          \"shape\":\"ULong\",\
          \"documentation\":\"<p>Horizontal pixel dimension of the video.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a video that Amazon Rekognition analyzed. <code>Videometadata</code> is returned in every page of paginated responses from a Amazon Rekognition video operation.</p>\"\
    },\
    \"VideoTooLargeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The file size or duration of the supplied media is too large. The maximum file size is 8GB. The maximum duration is 2 hours. </p>\",\
      \"exception\":true\
    }\
  },\
  \"documentation\":\"<p>This is the Amazon Rekognition API reference.</p>\"\
}\
";
}

@end
