# Imports
import json
import werkzeug
from flask import Flask, request, jsonify, send_file

# Importing only giveAnalyzedVideo from main.py
# from main import giveFacesCoordinates

# Flask
app = Flask(__name__)

# Routes for API

# /video_detection POST Route analyses the video using giveAnalyzedVideo function in main.py and returns the new video
# in the body of the request we need to pass the video.
@app.route("/video_analyse1", methods=["POST"])
def index1():
    # video
    videofile = request.files["video"]
    # Getting file name of the video using werkzeug library
    filename = werkzeug.utils.secure_filename(videofile.filename)
    print("\nReceived video File name : " + videofile.filename)
    # Saving the video in videos Directory
    videofile.save("videos/" + filename)
    # Passing the videoPath in this giveAnalyzedVideo function and getting the video
    # video = giveFacesCoordinates("./videos/" + filename)
    # Returns video in the json Format
    return 'Done'
@app.route("/video_analyse2", methods=["POST"])
def index2():
    # video
    videofile = request.files["video"]
    # Getting file name of the video using werkzeug library
    filename = werkzeug.utils.secure_filename(videofile.filename)
    print("\nReceived video File name : " + videofile.filename)
    # Saving the video in videos Directory
    videofile.save("videos/" + filename)
    # Passing the videoPath in this giveAnalyzedVideo function and getting the video
    # video = giveFacesCoordinates("./videos/" + filename)
    # Returns video in the json Format
    return 'Done'
@app.route("/video_analyse3", methods=["POST"])
def index3():
    # video
    videofile = request.files["video"]
    # Getting file name of the video using werkzeug library
    filename = werkzeug.utils.secure_filename(videofile.filename)
    print("\nReceived video File name : " + videofile.filename)
    # Saving the video in videos Directory
    videofile.save("videos/" + filename)
    # Passing the videoPath in this giveAnalyzedVideo function and getting the video
    # video = giveFacesCoordinates("./videos/" + filename)
    # Returns video in the json Format
    return 'Done'

@app.route("/return_video")
def return_video():
    return json(send_file('\left+middle+right-plane19s.mp4', attachment_filename='left+middle+right-plane19s.mp4'))

@app.route("/return_image")
def return_image():
    return json(send_file('\image.png', attachment_filename='image.png'))

# Running the app
app.run()
