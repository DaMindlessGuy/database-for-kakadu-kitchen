# Instructions that you need to help complete your bit 

1. Take a read of Insert\_example.sql to give you an example of what you need to do. 
2. You need to open up the .docx file in this repo and create a file inside of this repo called Insert\_43.sql and insert the data that you see from the .docx and make sure you look inside of the Create\_43.sql for the specifications. 
3. When exporting the data to upload. Under Database: `kitchen_43` -> `Export` -> click `Go`
4. Once you complete this , you can open up something like [GitHub Desktop](https://desktop.github.com/download/) or [Visual Studio Code](https://code.visualstudio.com/download) to help you upload code to GitHub. Worst comes to worst, if you can't upload the Insert_43.sql, just send it to me and I'll upload it. 


I will also upload these instructions for uploading code to GitHub that I wrote for another class: 

# How to contribute via github
1. You need to have created a github account and tell the project maintainer (Patrick) what your GitHub username is so I can add you as a contributer
2. You want to add your public SSH key to your GitHub account so you can push code. 
3. You do this by first going to `https://github.com` and then logging in. 
4. Click on your icon on the top right and then going to `Settings`
5. Under `Access` click on `SSH and GPG keys`
6. Click on `New SSH key` and give an appropriate name, such as `my SSH key`
7. Go to the terminal and type in `cat ~/.ssh/id_rsa.pub` and copy the output of that into `Key` then click on `Add SSH Key`
8. Now you can go back to your terminal and clone the source code to be able to work on it by using `git clone $REPO_LOCATIONS && cd $NAME_OF_REPO`
9. After making your contributions type in `git add .` `git commit -m Type in your message here` `git push`

