# ChowDrop

Food Delivery App built with flutter (Dart).

## Getting Started

This project is a starting point for a Flutter application.

### How to run project on physical android device

While android is connected via usb, run the command:

```sh
  adb devices
```
The above command shows you the list of connected devices

- Next, run:

```sh
  adb tcpip 5555
```
This will configure the the tcpip for connection with IP address of android device.

- Next, run:

```sh
  adb connect 192.168.23:5555
```
Where 192.168.23 is a "format example" of your android phone IP address.
The command above configures both the android and local computer on the same network.

Disconnect USB and the finally run:
```sh
  flutter run
```
This will spin up your application without USB connected.

### How to restart the application and resume development from where you stopped
- Connecting your device with USB and running it (with USB still intact) is pretty much straight forward.

- The problem, majority of the time, comes in when you wish to make use of the wireless debugging.

  Below are some things to note:
- Your android device IP address is constantly changing/fluctuating from time to time and so you may 
  need to reconnect adb using a new IP address.
- ISSUES: You may encounter this issue: "no connection could be made because target device actively 
  refused it". Just terminate adb processes. Check out this 
  [link](https://stackoverflow.com/questions/29826101/how-to-restart-adb-manually-from-android-studio). It 
  might be of help to you. 

- Another error you might encounter: "A socket operation was attempted to an unreachable host flutter".
  This is because your android device and local computer are NOT on the same network. I tried a range 
  of solutions [here](https://stackoverflow.com/questions/37267335/android-studio-wireless-adb-error-10061)
  but it did not "seem" to work (meaning it may have made changes I have no idea about, but I doubt that's 
  the case). What finally did the trick for me was that I simply turned on my phone hotspot (with my 
  internet connection active), connected my local computer WIFI it to  and voila, "adb connect << Android 
  IP ADDRESS >>:5555" was successfully connected. 

- NOTE:
  In the course of development, I would very much advice you to run the command: "pub get" 
  only when of absolute necessity. This is because running the "pub get" command alters 
  the structure of pubspec.yaml and will require gradle to build the application again 
  for each time using internet connection. This can be very much annoying.


### How to make changes in commit messages using Command-line/Vim
- For example,

```sh
  git rebase -i HEAD~5
```

- The number (5 in this case) refers to commit you wish to make changes.

- Next, git will display a list of commits with the "pick" keyword attached to all 5 previous
  commits.

- To begin making changes, first enter into the vim/command-line by pressing the "ESC + i" keys.
  This will give access to edit the "pick" keyword to "reword" keyword. This "reword" is what
  enables us to make changes to the commit messages/comments.

- Once this is done, press "ESC" to exit the vim.

- Next, press "SHIFT + zz". This will prompt the next interface. Based on the keyword we entered,
  the next interface will show you the commit message you wish to make changes to.

- Again, press "ESC + i" to enter into the vim again. Then make the changes to the comment.

- When you are done making corrections, press "ESC" to exit the vim.

- Then repeat "SHIFT + zz" to enter successfully. Once it is successful, you should see a similar
  message from git "Successfully rebased and updated refs/heads/main."

- Next push to github: "git push -f" WARNING: If you are working on a team, be careful when using
  the force flag -f, as someone on your team may be working on the existing copy of the repo, as
  force commits may be irreversible.

- Preferably, you may watch [this youtube video](https://www.youtube.com/watch?v=BNF4le5X1Ms).


## A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## How to change app/package name of your project