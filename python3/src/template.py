import sys
import fire
# from .version import Version
from version import Version
from typing import Union, Optional
import pexpect

class Template(object):
  """Example Class this class is Example for how to use fire.

  Longer class information....
  Longer class information....

  Attributes:
    offset: offset value add, multiple, and more ... used.
  """
  def __init__(self, offset: int =1) -> None:
      self._offset = offset

  def add(self, x: int, y: int) -> int:
    """Add to variable x, y.

    Retrieves rows pertaining to the given keys from the Table instance
    represented by table_handle.  String keys will be UTF-8 encoded.

    Args:
      x: int variable.
      y: int valiable.

    Returns:
       

    Raises:
        IOError: An error occurred accessing the smalltable.
    """

    # 試しにメールの送信
    # json使える変数のとリストを持っておく。
    # 使える展開文字列がなくても
    # テンプレートで使えない変数が選択されたらエラーにする。
    # メール送る時にパースでエラーだと壊れたテンプレートですと表示する。
    # 送るタイミングで使える変数が決まる。
    # 送るタイミングでどこまで使えるって決まっている。
    # 
    # 送るタイミングで

    # 変数展開以外で{}ブレースを使うな
    # phpなら${juice}
    # 変数展開以外しない処理にする。
    # 管理画面で試しに仮登録


    # 使えるリストの変数を作ってやる。
    # 初回決済
    # user_idと決済番号, 金額、いつ買ったか？
    dict= {'last_name':"abcd", 'first_name': "ddd"}

    template = """
    {last_name} 様
    """


    try:
        print(template.format(**dict))
    # 実際展開してみて、テンプレートで使えないキーならエラー
    except KeyError as err:
        print(err,file=sys.stderr)
    
    return x + y + self._offset

  def addUnion(self, x: Union[int, float], y: int) -> int:
    return x * y + self._offset

# below function dont recoginize fire. Optional hint dont understand.
#   def addOptional(self, x: Union[int, float], y: Optional[int]) -> int:
#     return x * y + self._offset

  def addOptional(self, x: int, y: int = None) -> int:
    return x * y + self._offset

  def multiply(self, x: int, y: int) -> int:
    return x * y + self._offset

  def install(self) -> None:
    Edition = self.Edition
    password = self.root_password
    shell_cmd = "/opt/mssql/bin/mssql-conf setup"
    prc = pexpect.spawn('/bin/bash', ['-c', shell_cmd],timeout=1200)
    prc.expect("Enter your edition")
    prc.sendline(Edition)
    prc.expect("Do you accept the license terms")
    prc.sendline("Yes")
    prc.expect("Enter the SQL Server system administrator password")
    prc.sendline(password)
    prc.expect("Confirm the SQL Server system administrator password")
    prc.sendline(password)
    prc.expect( pexpect.EOF )

  def noop(self, *args) -> None:
    """No operation function. this fucntion check arg variables.

    Retrieves rows pertaining to the given keys from the Table instance
    represented by table_handle.  String keys will be UTF-8 encoded.

    Args:
      x: int variable.
      y: int valiable.

    Returns:
       

    Raises:
        IOError: An error occurred accessing the smalltable.
    """
    print('send parameter is ...')
    print(*args)

if __name__ == '__main__':

  version = Version()
  if not version.check():
    print('python version greater than {1}.{2}'.
      format(version.valid_version.major,version.valid_version.minor)
      ,file=sys.stderr
    )
    exit(1)

  fire.Fire(Template)
