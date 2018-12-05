# distutils: language = c++

from libcpp.vector cimport vector

cdef extern from "_minmaxheap.h" namespace "minmaxheap":
	cdef cppclass MinMaxHeap[T]:
		MinMaxHeap()
		# MinMaxHeap(size_t reserve)
		# short level(size_t n)
		size_t size()
		void insert(T key)
		T peekmin()
		T peekmax()
		T popmin()
		T popmax()
		void reserve(size_t n)
		vector[T] getheap()
