from robot.api.deco import library, keyword
from robot.api.logger import info
from robot.api.exceptions import Error, Failure
import requests

onesec_mail_api_baseurl = "https://www.1secmail.com/api/v1/"

@library
class UserData():
    def __init__(self) -> None:
        pass

    @keyword
    def get_new_temp_email(self) -> str:
        r = requests.get(f"{onesec_mail_api_baseurl}?action=genRandomMailbox&count=1")
        data = r.json()
        return str(data[0])

        



        