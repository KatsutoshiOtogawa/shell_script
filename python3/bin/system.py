import sys
import fire
from version import Version
import os

class System(object):

    def __init__(self):
        # python_versionを環境変数で持っておく。
        pass

    def tipycal_os(self) -> str:
        # osの種類を返す。
        # Darwin, rhel, ubuntu, など
        pass

    def is_superuser(self) -> bool:
        check = False
        if os.geteuid() == 0 and os.getuid() == 0 :
            check = True
            print("管理者権限を持っています。")
        
        return check

# def check() -> bool:
#     check = False
#     if sys.version_info.major == 3 and sys.version_info.minor >= 6:
#       # sys.stderr.write('python version greater than 3.6')
#       check = True
#     return check

if __name__ == '__main__':
    version = Version()
    if not version.check():
        print(
            'python version greater than {1}.{2}'.
                format(version.setting.major,version.setting.minor)
            ,file=sys.stderr
        )
    fire.Fire(System)
    # python version.py check
    # python aaa.py add 10 20
    # python multiply 10 20



