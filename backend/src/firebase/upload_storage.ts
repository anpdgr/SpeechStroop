import { Storage } from '@google-cloud/storage'
import { SERVICE_ACCOUNT_KEY_PATH } from '../config'

const storage = new Storage({
  keyFilename: SERVICE_ACCOUNT_KEY_PATH,
})

let bucketName = 'speech-stroop.appspot.com'
const audioFolder = 'audio'

// Uploads a local file to the bucket
export const uploadFile = async (userId: string, filePath: string) => {
  const fileName = filePath.split('/').pop()
  const dstPath = `${audioFolder}/${userId}/${fileName}`
  await storage.bucket(bucketName).upload(filePath, {
    gzip: true,
    metadata: {
      cacheControl: 'public, max-age=31536000',
    },
    destination: dstPath,
  })

  console.log(`${filePath} was uploaded successfully.`)

  const fileUrl = await getFileUrl(dstPath)
  return fileUrl
}

const getFileUrl = async (filePath: string) => {
  const today = new Date()
  const thisYear = today.getFullYear()
  const urls = await storage
    .bucket(bucketName)
    .file(filePath)
    .getSignedUrl({ action: 'read', expires: today.setFullYear(thisYear + 5) })
  const signedUrl = urls[0]
  return signedUrl
}