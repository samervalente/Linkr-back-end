export default function getHashtagsIds(string){
        let arr = []
        const filt = []
     
         if(string.length > 0){
              arr = string.split(" ")
             let arrHashtags = arr.filter(word => word.startsWith("#"))
     
             if(arrHashtags.length > 0){
                 arrHashtags = arrHashtags.join(",").split("#")
                 arrHashtags = arrHashtags.filter(hashtag => {
                     if(hashtag.length > 1){
                         return hashtag
                     }
                 })
             
                 for(let hashtag of arrHashtags){
                    
                    hashtag = hashtag.replaceAll(",","").replace(/[\r\n\\/]/gm, '')
                    
                    console.log(hashtag)
                     filt.push(hashtag)
                 }
                
              return filt
             }
         }
         
         return []
        
}

