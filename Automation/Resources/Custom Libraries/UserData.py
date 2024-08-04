from robot.api.deco import library, keyword
from robot.api.logger import info
from robot.api.exceptions import Error, Failure
import requests

onesec_mail_api_baseurl = "https://www.1secmail.com/api/v1/"

generated_emails_file_loc = '.\\Resources\\generated_emails.txt'

@library
class UserData():
    def __init__(self) -> None:
        pass
    
    def save_generated_account_credentials(self, email:str) -> None:
        with open(generated_emails_file_loc, 'w') as file:
            file.write(f'{email}\n')

    @keyword
    def get_new_temp_email(self) -> str:
        r = requests.get(f"{onesec_mail_api_baseurl}?action=genRandomMailbox&count=1")
        data = r.json()
        # save generated email for future login checks
        try:
            self.save_generated_account_credentials(data[0])
        except Exception as err:
            info('Could not find the directory. Proceeding with the tests.')
            info('LOGIN TEST SHOULD FAIL DUE TO THIS EXCEPTION')
        finally:
            # return newly generated email to the test routine
            return str(data[0])
    
    @keyword
    def get_most_recent_generated_email(self) -> str:
        with open(generated_emails_file_loc, 'r') as file:
            email = file.readline()
        
        return email.strip()

