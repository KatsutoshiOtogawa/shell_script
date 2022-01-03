
import sys
import fire
from version import Version
import pexpect
import os
import smtplib
from email.message import EmailMessage
from email.headerregistry import Address
from typing import Tuple
from dataclasses import dataclass
from copy import deepcopy

# server本体の処理
# 
# hotbackup coldbackup
# aws s3 upload　yyyy/mm/dd/時間.tar.gz という形で固める。
# sftp upload
# cloud bucket
# sync development

# sync development email passwordをdevelopersとかに変更する。
# private key path
# rsync -e "ssh -i ~/.ssh/id_rsa" -avz 転送元ファイル ユーザー名@転送先アドレス:転送先ディレクトリ/

@dataclass
class MailSetting:
    """create MailSetting
    """

    msg = EmailMessage()
    msg["Subject"] = "Mail Subject"
    msg["To"] = (Address("your_name", "vscode", "localhost"))
    msg["From"] = (Address("your_name", "vscode", "localhost"))
    msg.set_content("""\
            Salut!

            Cela ressemble à un excellent recipie[1] déjeuner.

            [1] http://www.yummly.com/recipe/Roasted-Asparagus-Epicurious-203718

            --Pepé
            """
        )
    noop: bool = False

@dataclass
class Mail:
    setting = MailSetting()

    def send(self, setting: MailSetting=None) -> int:

# subject, to, from
        if setting is None:
            setting = deepcopy(self.setting)

        # set variable from parameter.
        # if manuscript:
        #     setting.manuscript = manuscript
        # if title:
        #     setting.title = title
        # if out:
        #     setting.out = out
        # if css:
        #     setting.css = css
        # if cover_image:
        #     setting.cover_image = cover_image
        # if target:
        #     setting.target = target
        # 送受信先
        
        # MIMETextを作成
        # message = "メール本文"
        
        with smtplib.SMTP("localhost", 25) as smtp:
            # 疎通確認
            if self.setting.noop:
                smtp.noop()
                return 0
            # メールを送信する
            smtp.send_message(self.setting.msg)
        return 0
        
    def install(self) -> None:

        # wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
        # subprocess.run([
        #     'pandoc','-f','markdown'
        #     ,'-t', 'epub3'
        #     ,self.manuscript
        #     ,self.title
        #     ,'-o', self.out
        #     ,'--css', self.css
        #     ,'--otc', '--toc-depth=2'
        #     ,'--epub-cover-image={}'.format(self.cover_image)
        # ], capture_output=True)
        pass

if __name__ == '__main__':
    version = Version()
    if not version.check():
        print(
            'python version greater than {1}.{2}'.
                format(version.setting.major,version.setting.minor)
            ,file=sys.stderr
        )
        exit(1)

    fire.Fire(Mail)
    # python aaa.py add 10 20
    # python multiply 10 20
