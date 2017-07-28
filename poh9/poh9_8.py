#!/usr/bin/python
def simplify_path(path):
	a=path.split('/')
	st=[]
	for e in a:
		if e=='.' or e=='':
			pass
		elif e=='..':
			if st:
				st.pop()
			else:
				#warn('We have Directory Traversal')
				pass
		else:
			st.append(e)
	return ('/' if path[0]=='/' else '')+'/'.join(st)

if __name__=='__main__':
	if True:
		print(simplify_path('/'.join(input().split())))