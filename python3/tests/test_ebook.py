import pytest

from src.ebook import Ebook

@pytest.mark.parametrize(('x', 'y'), [
    (-1, -3),
    (0, -3),
    (2, 3),
    (4, 5),
   
])
def test_add(x, y):

    ebook = Ebook()

    # assert ebook.add(x, y)
