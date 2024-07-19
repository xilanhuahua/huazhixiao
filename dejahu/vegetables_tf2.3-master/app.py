from flask import Flask, request, jsonify
import os
os.environ['TF_ENABLE_ONEDNN_OPTS'] = '0'
import tensorflow as tf
TF_ENABLE_ONEDNN_OPTS = 0
import numpy as np
import cv2
from PIL import Image

from werkzeug.utils import secure_filename

app = Flask(__name__)



# 加载模型
model = tf.keras.models.load_model("models/mobilenet_flower.h5")

# 定义类别名称
class_names = ['alpine sea holly', 'anthurium', 'artichoke', 'azalea', 'balloon flower', 'barberton daisy',
               'bee balm', 'bird of paradise', 'bishop of llandaff', 'black-eyed susan', 'blackberry lily',
               'blanket flower', 'bolero deep blue', 'bougainvillea', 'bromelia', 'buttercup', 'californian poppy',
               'camellia', 'canna lily', 'canterbury bells', 'cape flower', 'carnation', 'cautleya spicata',
               'clematis', "colt's foot", 'columbine', 'common dandelion', 'common tulip', 'corn poppy', 'cosmos',
               'cyclamen', 'daffodil', 'daisy', 'desert-rose', 'fire lily', 'foxglove', 'frangipani', 'fritillary',
               'garden phlox', '山桃草属', 'gazania', 'geranium', 'giant white arum lily', 'globe thistle', 'globe-flower',
               'grape hyacinth', 'great masterwort', 'hard-leaved pocket orchid', 'hibiscus', 'hippeastrum', 'iris',
               'japanese anemone', 'king protea', 'lenten rose', 'lilac hibiscus', 'lotus', 'love in the mist', 'magnolia',
               'mallow', 'marigold', 'mexican petunia', 'monkshood', 'moon orchid', 'morning glory', 'orange dahlia',
               'osteospermum', 'passion flower', 'peruvian lily', 'petunia', 'pincushion flower', 'pink primrose',
               'pink quill', 'pink-yellow dahlia', 'poinsettia', 'primula', 'prince of wales feathers', 'purple coneflower',
               'red ginger', 'rose', 'ruby-lipped cattleya', 'siam tulip', 'silverbush', 'snapdragon', 'spear thistle',
               'spring crocus', 'stemless gentian', 'sunflower', 'sweet pea', 'sweet william', 'sword lily', 'thorn apple',
               'tiger lily', 'toad lily', 'tree mallow', 'tree poppy', 'trumpet creeper', 'wallflower', 'water lily',
               'watercress', 'wild geranium', 'wild pansy', 'wild rose', 'windflower', 'yellow iris']

# 创建一个保存上传图片的文件夹
UPLOAD_FOLDER = 'images'
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# 图片上传和识别的接口
@app.route('/predict', methods=['POST'])
def predict():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part'}), 400
    file = request.files['file']
    if file.filename == '':
        return jsonify({'error': 'No selected file'}), 400

    if file:
        filename = secure_filename(file.filename)
        filepath = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        file.save(filepath)

        # 预处理图片
        img = cv2.imread(filepath)
        img = cv2.resize(img, (224, 224))
        img = np.asarray(img)

        # 预测图片
        outputs = model.predict(img.reshape(1, 224, 224, 3))
        result_index = int(np.argmax(outputs))
        result = class_names[result_index]

        return jsonify({'flower_name': result})

if __name__ == "__main__":
    app.run(debug=True)
