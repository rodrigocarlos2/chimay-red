import requests
import io
import PySquashfsImage



# r = requests.get(
#     'https://download2.mikrotik.com/routeros/6.34.2/routeros-x86-6.34.2.npk',
#     stream=True
# )

f = open('download/routeros-x86-6.34.2.npk')

squash = PySquashfsImage.SquashFsImage(offset=0x1000)
squash.setFile(f)
