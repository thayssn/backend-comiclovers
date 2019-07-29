import multer from 'multer';
import path from 'path';

const multerConfig = folderName => {
  return {
    storage: multer.diskStorage({
      destination: path.resolve(
        __dirname,
        '..',
        '..',
        '..',
        'media',
        folderName
      ),
      filename: (req, file, cb) => {
        cb(null, file.originalname);
      },
    }),
  };
};

export default function upload(folderName, fieldName) {
  return multer(multerConfig(folderName)).single(fieldName);
}
