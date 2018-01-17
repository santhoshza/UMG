# 1. This will create an umg user, output access & secret key and set password as "MeerKatsAreGreat"
# 2. Please execute "terraform apply" to create the user and note down the access & secret key from the output.   
# 3. Run below commands using awscli to set the password.
# 4. command "aws iam create-login-profile --cli-input-json file://create-login-profile.json"
Success Output:

{
    "LoginProfile": {
        "UserName": "umg",
        "CreateDate": "2018-01-17T16:07:21.354Z",
        "PasswordResetRequired": false
    }
}
