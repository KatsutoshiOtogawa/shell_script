
import sys
import fire
from version import Version
import pexpect
import os
from dataclasses import dataclass
from copy import deepcopy
from enum import Enum

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

class MsSQLServerEdition(Enum):
    # Express is 3
    Express=3

@dataclass
class MsSQLServerSetting:
    edition: int = MsSQLServerEdition.Express
    password: str = os.environ['SQLSERVER_PASSWORD']

@dataclass
class MsSQLServer:
    setting = MsSQLServerSetting()
        
    def __setSetting(self, edition: MsSQLServerEdition=None, password: str=None, setting: MsSQLServerSetting=None) -> MsSQLServerSetting:

        if setting is None:
            setting = deepcopy(self.setting)

        # set variable from parameter.
        if edition is not None:
            setting.edition = edition
        if password:
            setting.password = password
        return setting

    def install(self) -> None:

        # wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
        # try:
        #     subprocess.run([
        #         'pandoc','-f','markdown'
        #         ,'-t', 'epub3'
        #         ,path.join(setting.target, setting.manuscript)
        #         ,path.join(setting.target, setting.title)
        #         ,'-o', path.join(setting.target, setting.out)
        #         ,'--css', path.join(setting.target, setting.css)
        #         ,'--toc', '--toc-depth=2'
        #         ,'--epub-cover-image={}'.format(path.join(setting.target, setting.cover_image))
        #     ],check=True
        #     ,capture_output=True)
        # except CalledProcessError as err:
        #     print(err.stderr, file=sys.stderr)
        pass

    def setup(self,edition: MsSQLServerEdition=None, password: str=None, setting: MsSQLServerSetting=None) -> None:

        self.setting = self.__setSetting(edition, password, setting)

        shell_cmd = "/opt/mssql/bin/mssql-conf setup"
        prc = pexpect.spawn('/bin/bash', ['-c', shell_cmd],timeout=1200)
        prc.expect("Enter your edition")
        prc.sendline(self.setting.edition)
        prc.expect("Do you accept the license terms")
        prc.sendline("Yes")
        prc.expect("Enter the SQL Server system administrator password")
        prc.sendline(self.setting.password)
        prc.expect("Confirm the SQL Server system administrator password")
        prc.sendline(self.setting.password)
        prc.expect( pexpect.EOF )

if __name__ == '__main__':
    version = Version()
    if not version.check():
        print(
            'python version greater than {1}.{2}'.
                format(version.setting.major,version.setting.minor)
            ,file=sys.stderr
        )
        exit(1)

    fire.Fire(MsSQLServer)
    # python aaa.py add 10 20
    # python multiply 10 20
