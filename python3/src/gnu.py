from dataclasses import dataclass
from copy import deepcopy
import subprocess,shlex

@dataclass
class Gnu:
    """this class is 違いを九州する BSD command and gnu command.
    composit して使うと良い。
    gnu = GnuEnvironment()
    """
    sed = 'sed'
    awk = 'awk'
    xargs = 'xargs'
    find = 'find'
    date = 'date'
    cut = 'cut'

    def __init__(self):

        if self.is_BSD():
            self.sed = 'gsed'
            self.awk = 'gawk'
            self.xargs = 'gxargs'
            self.find = 'gfind'
            self.date = 'gdate'
            self.cut = 'gcut'

    def is_BSD(self) -> bool:
        judge = False
        command1 = 'uname'
        command2 = 'grep -e Darwin -e BSD > /dev/null'

        process1=subprocess.Popen(shlex.split(command1),stdout=subprocess.PIPE)
        process2=subprocess.Popen(shlex.split(command2),stdin=process1.stdout)

        if process2.returncode == 0:
            judge = True

# コマンドの存在確認も入れる
        return judge

def which(command: str) -> str:
    """wrapper bash which command.

    Args:
      command: command you want to execute which.

    Returns:
      command path.

    Raises:
      CommandNotFoundException: If command not found occured on error.
    """
    process = subprocess.run(['which',command ], check=True, capture_output=True, text=True, stdout=subprocess.PIPE)

    if process.returncode !=0:
        raise CommandNotFoundException('command not found')

    return process.stdout

class CommandNotFoundException(RuntimeError):

    def __init__(self, *args: object) -> None:
        super().__init__(*args)
