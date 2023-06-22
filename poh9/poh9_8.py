#!/usr/bin/python
def simplify_path(path):
	a=path.split('/')
	st=[]
	for e in a:
		if e=='.' or e=='':
			pass
		elif e=='..':
			if st and st[-1]!='..':
				st.pop()
			else:
				#warn('We have Directory Traversal')
				if path[0]!='/': st.append('..')
		else:
			st.append(e)
	r=('/' if path[0]=='/' else '')+'/'.join(st)
	return r if r else '.'

if __name__=='__main__':
	if True:
		print(simplify_path('/'.join(input().split())))
