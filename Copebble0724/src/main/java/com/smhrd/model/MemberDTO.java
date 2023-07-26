package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class MemberDTO {

   @NonNull private String ID;
   private String FAMILY_KEY;
   @NonNull private String PW;
   private String NAME;

   public MemberDTO(String ID, String PW, String NAME) {
      this.ID = ID;
      this.PW = PW;
      this.NAME = NAME;
   }

   public MemberDTO(String ID, String PW) {
      this.ID = ID;
      this.PW = PW;
   }
   

}