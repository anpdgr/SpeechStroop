import { ObjectId } from 'mongoose'
import { uploadFile } from 'src/firebase/upload_storage'
import { removeAudioFiles } from 'src/utils/remove_audio_file'

export interface AudioDTO {
  directory: string
  dateTime: string
}

export async function uploadStroopAudioFile(
  audioFile: AudioDTO,
  userId: ObjectId,
): Promise<string[]> {
  let urls: string[] = []
  let filePaths: string[] = []

  for (let i = 0; i < 3; i++) {
    let fileName: string = `${audioFile.dateTime}_section-${i + 1}.wav`
    let filePath: string = `${audioFile.directory}/${fileName}`

    let url: string = await uploadFile(String(userId), filePath)

    urls.push(url)

    filePaths.push(filePath)
  }

  await removeAudioFiles(filePaths)

  return urls
}
