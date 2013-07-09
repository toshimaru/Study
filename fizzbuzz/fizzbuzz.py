
def fizzbuzz(max):
    for val in range(1, max + 1):
        if (val % 15 == 0):
            print 'fizzbuzz'
        elif (val % 5 == 0):
            print 'buzz'
        elif (val % 3 == 0):
            print 'fizz'
        else:
            print val

fizzbuzz(100)
