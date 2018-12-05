# distutils: language = c++

from minmaxheap cimport MinMaxHeap
from libcpp.vector cimport vector
from pyminmaxheap import MinMaxHeap as PyMinMaxHeap, minmaxheapproperty


def test_heap(n):
	from random import randint
	cdef MinMaxHeap[int] heap = MinMaxHeap[int]()
	heap.reserve(n)
	h2 = PyMinMaxHeap(n)
	l = []
	for _ in range(n):
		x = randint(0, 5 * n)
		heap.insert(x)
		h2.insert(x)
		l.append(x)
		assert minmaxheapproperty(heap.getheap(), heap.size())
		if list(h2.a)[:len(h2)] != list(heap.getheap()):
			print("Py ", h2.a[:len(h2)])
			print("C++", heap.getheap())
			assert list(h2.a)[:len(h2)] == list(heap.getheap())

	assert heap.size() == len(l)
	cdef vector[int] h = heap.getheap()
	print(h)

	while heap.size() > 0:
		if min(l) != heap.peekmin() or max(l) != heap.peekmax():
			print("l_min: %d l_max: %d h_min: %d h_max: %d\n"
				  % (min(l), max(l), heap.peekmin(), heap.peekmax()))
		assert min(l) == heap.peekmin()
		assert max(l) == heap.peekmax()
		if randint(0, 1):
			e = heap.popmin()
			assert e == min(l)
		else:
			e = heap.popmax()
			assert e == max(l)
		# print(e, heap.size())
		l[l.index(e)] = l[-1]
		l.pop(-1)
		assert heap.size() == len(l)
		assert minmaxheapproperty(heap.getheap(), heap.size())

	print("OK")


def benchmark(n):
	from random import randint
	from time import perf_counter
	cdef:
		MinMaxHeap[int] heap
		vector[int] l = [randint(0, 5 * n) for _ in range(n)]
		vector[int] actions = [randint(0, 1) for _ in range(n)]
		int x, a, e

	start = perf_counter()
	for x in l:
		heap.insert(x)
	for a in actions:
		if a:
			e = heap.popmin()
		else:
			e = heap.popmax()
	print("Time C++ heap: %f" % (perf_counter() - start))

	pyheap = PyMinMaxHeap(n)

	start = perf_counter()
	for x in l:
		pyheap.insert(x)
	for a in actions:
		if a:
			e = pyheap.popmin()
		else:
			e = pyheap.popmax()
	print("Time PyHeap: %f" % (perf_counter() - start))

