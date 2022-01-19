import pytest

from src.example import Example

@pytest.mark.parametrize(('x', 'y'), [
    (-1, -3),
    (0, -3),
    (2, 3),
    (4, 5),
   
])
def test_add(x, y):

    example = Example()

    assert example.add(x, y)

    # assert not is_prime(1)
    # assert is_prime(2)
    # assert is_prime(3)
    # assert not is_prime(4)
    # assert is_prime(5)
    # assert not is_prime(6)
    # assert is_prime(7)
    # assert not is_prime(8)
    # assert not is_prime(9)
    # assert not is_prime(10)

    # assert is_prime(number) == expected
    
